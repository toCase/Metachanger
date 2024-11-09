# -*- mode: python ; coding: utf-8 -*-

files = [
    ('qml/main.qml', './qml'),
    ('qml/App.qml', './qml'),
    ('qml/Meta.qml', './qml'),
    ('qml/Sett.qml', './qml'),
]

a = Analysis(
    ['app.py'],
    pathex=[],
    binaries=[],
    datas=files,
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)
pyz = PYZ(a.pure)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name='MetadataChanger',
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=False,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    icon=['icon.ico'],
)
