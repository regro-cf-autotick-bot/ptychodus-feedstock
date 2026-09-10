export SETUPTOOLS_SCM_PRETEND_VERSION="${PKG_VERSION}"
$PYTHON -m pip install . -vv --no-deps --no-build-isolation
# ptychodus-store needs the [store] extra (fastapi, fastmcp, uvicorn, sqlalchemy,
# aiosqlite, pillow, pydantic-settings, python-multipart), which this package does not
# pull in, and its web UI is not compiled in the release archive. Drop the wrapper so no
# broken console script ships.
rm -f "$PREFIX/bin/ptychodus-store"
