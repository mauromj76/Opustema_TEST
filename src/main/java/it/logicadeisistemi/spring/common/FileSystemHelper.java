package it.logicadeisistemi.spring.common;

import java.io.File;

public class FileSystemHelper {

    /**
     * Checks if a directory exists. If it does not exist it is created.
     * 
     * @param path the path, with trailing "/", where to look for the folder.
     * @param folder the folder name. If path parameters includes the name leave this empty string
     * @return the complete path of the directory, i.e. path + folder.
     */
    public String createFolderIfNotExists(String path, String folder) {

        String name = path + folder;

        File theDir = new File(name);

        // if the directory does not exist, create it
        if (!theDir.exists()) {
            System.out.println("creating directory: " + name);
            theDir.mkdir();
        }

        return name;
    }
}
