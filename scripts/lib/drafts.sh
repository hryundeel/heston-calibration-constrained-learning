# Shared helpers for publish-draft and collect-review. Sourced, not run.
#
# Settings, overridable through the environment (the test script uses them):
#   ORIGIN_REMOTE    GitHub remote             (default: origin)
#   OVERLEAF_REMOTE  Overleaf project remote   (default: overleaf)
#   MAIN_BRANCH      branch drafts come from   (default: main)

ORIGIN_REMOTE="${ORIGIN_REMOTE:-origin}"
OVERLEAF_REMOTE="${OVERLEAF_REMOTE:-overleaf}"
MAIN_BRANCH="${MAIN_BRANCH:-main}"

# Overleaf's history is fetched here, outside refs/heads and refs/tags,
# so it never gets pushed to GitHub by accident.
OVERLEAF_REF="refs/overleaf/head"

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

info() {
  printf '%s\n' "$*"
}

cd_repo_root() {
  local root
  root="$(git rev-parse --show-toplevel 2>/dev/null)" || die "not inside a git repository"
  cd "$root"
}

require_remote() {
  git remote get-url "$1" >/dev/null 2>&1 || die "no git remote named '$1' (see README, 'Drafts and supervisor review')"
}

# The Overleaf project has a single branch. Its name is read from the remote
# rather than assumed, because new projects use main and older ones master.
overleaf_branch() {
  local heads
  heads="$(git ls-remote --heads "$OVERLEAF_REMOTE")" || die "cannot reach '$OVERLEAF_REMOTE'; check the Git token in your Keychain"
  [ -n "$heads" ] || die "'$OVERLEAF_REMOTE' has no branches"
  [ "$(printf '%s\n' "$heads" | wc -l | tr -d ' ')" = "1" ] || die "'$OVERLEAF_REMOTE' has more than one branch"
  printf '%s\n' "$heads" | sed 's|.*refs/heads/||'
}

fetch_origin() {
  git fetch --quiet --tags "$ORIGIN_REMOTE" "$MAIN_BRANCH" || die "cannot fetch '$ORIGIN_REMOTE'"
}

fetch_overleaf() {
  # Overleaf's history shares no commits with this repository, so git warns
  # "no common commits" on every fetch; only real failures are shown.
  local err
  err="$(git fetch --quiet --no-tags "$OVERLEAF_REMOTE" "+refs/heads/$1:$OVERLEAF_REF" 2>&1)" \
    || die "cannot fetch '$OVERLEAF_REMOTE': $err"
}

# Number of the newest draft-N tag, or nothing if there is none.
last_draft_number() {
  git tag -l 'draft-*' | sed -n 's/^draft-\([0-9][0-9]*\)$/\1/p' | sort -n | tail -1
}

# Tree object of thesis/ at a commit.
thesis_tree() {
  git rev-parse --verify --quiet "$1:thesis" || die "'$1' has no thesis/ directory"
}

# Overleaf commit recorded in docs/reviews/draft-N.md on main, if any.
recorded_overleaf_commit() {
  { git show "$ORIGIN_REMOTE/$MAIN_BRANCH:docs/reviews/draft-$1.md" 2>/dev/null || true; } \
    | sed -n 's/^- \*\*Overleaf commit:\*\* `\([0-9a-f]\{40\}\)`.*/\1/p' \
    | head -1
}

# Tree of a commit, or nothing if the commit isn't available locally.
commit_tree_or_empty() {
  [ -n "$1" ] || return 0
  git rev-parse --verify --quiet "$1^{tree}" || true
}
