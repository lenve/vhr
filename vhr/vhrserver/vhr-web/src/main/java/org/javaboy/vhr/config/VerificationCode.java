package org.javaboy.vhr.config;

import javax.imageio.ImageIO;
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.security.SecureRandom;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-09-29 7:37
 *
 * 生成验证码的工具类
 */
public class VerificationCode {
    /**
     * 验证码图片宽度（像素）
     */
    private static final int WIDTH = 100;
    /**
     * 验证码图片高度（像素）
     */
    private static final int HEIGHT = 30;
    /**
     * 验证码字符个数
     */
    private static final int CODE_COUNT = 4;
    /**
     * 干扰线条数
     */
    private static final int LINE_COUNT = 5;
    /**
     * 随机颜色分量上限（避免过亮难以辨认）
     */
    private static final int COLOR_BOUND = 150;
    /**
     * 字号最小值
     */
    private static final int FONT_SIZE_BASE = 24;
    /**
     * 字号随机浮动范围
     */
    private static final int FONT_SIZE_RANGE = 5;
    /**
     * 字符基线距底部偏移（像素）
     */
    private static final int BASELINE_OFFSET = 8;
    /**
     * 干扰线粗细
     */
    private static final float LINE_STROKE_WIDTH = 1.5f;

    private static final String[] FONT_NAMES = {"宋体", "楷体", "隶书", "微软雅黑"};
    private static final String CODE_CHARS = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

    /**
     * 验证码用于安全场景，使用 SecureRandom 防止被预测
     */
    private final SecureRandom random = new SecureRandom();
    /**
     * 背景颜色：白色
     */
    private final Color bgColor = new Color(255, 255, 255);
    /**
     * 记录随机字符串
     */
    private String text;

    /**
     * 获取一个随意颜色
     *
     * @return 随机颜色
     */
    private Color randomColor() {
        int red = random.nextInt(COLOR_BOUND);
        int green = random.nextInt(COLOR_BOUND);
        int blue = random.nextInt(COLOR_BOUND);
        return new Color(red, green, blue);
    }

    /**
     * 获取一个随机字体
     *
     * @return 随机字体
     */
    private Font randomFont() {
        String name = FONT_NAMES[random.nextInt(FONT_NAMES.length)];
        int style = random.nextInt(4);
        int size = random.nextInt(FONT_SIZE_RANGE) + FONT_SIZE_BASE;
        return new Font(name, style, size);
    }

    /**
     * 获取一个随机字符
     *
     * @return 随机字符
     */
    private char randomChar() {
        return CODE_CHARS.charAt(random.nextInt(CODE_CHARS.length()));
    }

    /**
     * 创建一个空白的BufferedImage对象
     *
     * @return 空白图片
     */
    private BufferedImage createImage() {
        BufferedImage image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        // 设置验证码图片的背景颜色
        g2.setColor(bgColor);
        g2.fillRect(0, 0, WIDTH, HEIGHT);
        return image;
    }

    /**
     * 生成验证码图片
     *
     * @return 验证码图片
     */
    public BufferedImage getImage() {
        BufferedImage image = createImage();
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < CODE_COUNT; i++) {
            String s = String.valueOf(randomChar());
            sb.append(s);
            g2.setColor(randomColor());
            g2.setFont(randomFont());
            float x = i * WIDTH * 1.0f / CODE_COUNT;
            g2.drawString(s, x, HEIGHT - BASELINE_OFFSET);
        }
        this.text = sb.toString();
        drawLine(image);
        return image;
    }

    /**
     * 绘制干扰线
     *
     * @param image 待绘制干扰线的图片
     */
    private void drawLine(BufferedImage image) {
        Graphics2D g2 = (Graphics2D) image.getGraphics();
        for (int i = 0; i < LINE_COUNT; i++) {
            int x1 = random.nextInt(WIDTH);
            int y1 = random.nextInt(HEIGHT);
            int x2 = random.nextInt(WIDTH);
            int y2 = random.nextInt(HEIGHT);
            g2.setColor(randomColor());
            g2.setStroke(new BasicStroke(LINE_STROKE_WIDTH));
            g2.drawLine(x1, y1, x2, y2);
        }
    }

    public String getText() {
        return text;
    }

    /**
     * 将验证码图片写入输出流
     *
     * @param image 验证码图片
     * @param out   输出流
     * @throws IOException 写入失败时抛出
     */
    public static void output(BufferedImage image, OutputStream out) throws IOException {
        ImageIO.write(image, "JPEG", out);
    }
}
