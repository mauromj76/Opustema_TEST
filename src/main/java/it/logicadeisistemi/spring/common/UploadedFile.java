package it.logicadeisistemi.spring.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;

/**
 *
 * @author Luca
 */
public class UploadedFile {

    public int length;
    public byte[] bytes;
    public String name;
    public String type;

    public void save(String serverFileName) {
        File file = new File("imgaule" + FileSystems.getDefault().getSeparator() + "TSFILE2-TOBEDEL-" + name);
        FileOutputStream fos = null;
        try {
            boolean created = file.getParentFile().mkdirs();
            System.out.println("Folders created = " + created);
            file.createNewFile();
            String path = file.getParent();
            System.out.println("Il percorso del file è " + path);
            path = file.getAbsolutePath();
            System.out.println("Il percorso completo del file è " + path);
            fos = new FileOutputStream(file);
            // Writes bytes from the specified byte array to this file output stream
            fos.write(bytes);
        } catch (FileNotFoundException e) {
            System.out.println("File not found" + e);
        } catch (IOException ioe) {
            System.out.println("Exception while writing file " + ioe);
        } finally {
            // close the streams using close method
            try {
                if (fos != null) {
                    fos.close();
                }
            } catch (IOException ioe) {
                System.out.println("Error while closing stream: " + ioe);
            }
        }

    }
}
