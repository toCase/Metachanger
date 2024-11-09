from PySide6.QtCore import QObject, Slot, QUrl, QDir

class Misc(QObject):
    def __init__(self, parent = None):
        super().__init__(parent)
        
    @Slot(QUrl, result=str)
    def changeURL(self, url:QUrl) -> str:
        return url.toLocalFile()
    
    @Slot(str, result=str)
    def getFolderInfo(self, dir:str) -> str:
        folder = QDir(QDir.toNativeSeparators(dir))
        png_filter = [QDir.Filter.Files, "*.png"]
        png_count = len(folder.entryList(png_filter))
        
        jpg_filter = [QDir.Filter.Files, "*.jpg"]
        jpg_count = len(folder.entryList(jpg_filter))
        
        eps_filter = [QDir.Filter.Files, "*.eps"]
        eps_count = len(folder.entryList(eps_filter))
        
        result:str = f'''Directory - {dir} \nNumber of files: PNG - {png_count} | JPG - {jpg_count} | EPS - {eps_count} \n\n'''
        
        return result
        