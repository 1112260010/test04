package util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取配置文件
 */
public class ConfigManager {
    private static ConfigManager configManager = new ConfigManager();      //单例模式
    private Properties properties = null;

    private ConfigManager(){
        String path = "sql.properties";
        InputStream inputStream = ConfigManager.class.getClassLoader().getResourceAsStream(path);
        properties = new Properties();
        try {
            properties.load(inputStream);
            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static ConfigManager getConfigManager(){
        return configManager;
    }

    public String getValue(String key){
        return properties.getProperty(key);
    }
}
