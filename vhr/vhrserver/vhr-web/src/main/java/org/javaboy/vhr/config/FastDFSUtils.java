package org.javaboy.vhr.config;

import org.csource.common.MyException;
import org.csource.fastdfs.ClientGlobal;
import org.csource.fastdfs.StorageClient1;
import org.csource.fastdfs.TrackerClient;
import org.csource.fastdfs.TrackerServer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2020-03-02 23:26
 */
public class FastDFSUtils {
    private static final Logger logger = LoggerFactory.getLogger(FastDFSUtils.class);
    /**
     * 文件名后缀分隔符
     */
    private static final String FILE_EXTENSION_SEPARATOR = ".";
    /**
     * FastDFS 配置文件位置
     */
    private static final String FASTDFS_CONFIG_LOCATION = "fastdfs-client.properties";

    private static StorageClient1 client1;

    static {
        try {
            ClientGlobal.initByProperties(FASTDFS_CONFIG_LOCATION);
            TrackerClient trackerClient = new TrackerClient();
            TrackerServer trackerServer = trackerClient.getConnection();
            client1 = new StorageClient1(trackerServer, null);
        } catch (IOException e) {
            logger.error("初始化 FastDFS 客户端失败", e);
        } catch (MyException e) {
            logger.error("初始化 FastDFS 客户端失败", e);
        }
    }

    public static String upload(MultipartFile file) {
        String oldName = file.getOriginalFilename();
        if (oldName == null || !oldName.contains(FILE_EXTENSION_SEPARATOR)) {
            logger.warn("上传文件缺少原始文件名或后缀，无法上传: {}", file.getName());
            return null;
        }
        try {
            return client1.upload_file1(file.getBytes(),
                    oldName.substring(oldName.lastIndexOf(FILE_EXTENSION_SEPARATOR) + 1), null);
        } catch (IOException e) {
            logger.error("FastDFS 文件上传失败", e);
        } catch (MyException e) {
            logger.error("FastDFS 文件上传失败", e);
        }
        return null;
    }

}
