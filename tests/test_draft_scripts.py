import subprocess
from pathlib import Path

SCRIPTS = Path(__file__).resolve().parent.parent / "scripts"


def test_review_cycle_against_simulated_overleaf():
    result = subprocess.run(
        [str(SCRIPTS / "test-drafts")], capture_output=True, text=True, check=False
    )
    assert result.returncode == 0, result.stdout + result.stderr
