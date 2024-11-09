import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

import misc
import meta

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    
    appMisc = misc.Misc()
    engine.rootContext().setContextProperty("misc", appMisc)
    
    xlsWorker = meta.XLS_Maker()
    engine.rootContext().setContextProperty("xlsWorker", xlsWorker)
    
    metaChanger = meta.MetaChange()
    engine.rootContext().setContextProperty("metaChanger", metaChanger)
    
    
    qml_file = Path(__file__).resolve().parent / "qml/main.qml"
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())