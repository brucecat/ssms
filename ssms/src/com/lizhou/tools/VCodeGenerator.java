package com.lizhou.tools;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 楠岃瘉鐮佺敓鎴愬櫒
 */

public class VCodeGenerator {
	
	/**
	 * 楠岃瘉鐮佹潵婧�
	 */
	final private char[] code = {
		'2', '3', '4', '5', '6', '7', '8', '9',
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
		'k', 'm', 'n', 'p', 'q', 'r', 's', 't', 'u', 'v', 
		'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F',
		'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R',
		'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
	};
	/**
	 * 瀛椾綋
	 */
	final private String[] fontNames = new String[]{
			"榛戜綋", "瀹嬩綋", "Courier", "Arial", 
			"Verdana", "Times", "Tahoma", "Georgia"};
	/**
	 * 瀛椾綋鏍峰紡
	 */
	final private int[] fontStyles = new int[]{
			Font.BOLD, Font.ITALIC|Font.BOLD
	};
	
	/**
	 * 楠岃瘉鐮侀暱搴�
	 * 榛樿4涓瓧绗�
	 */
	private int vcodeLen = 4;
	/**
	 * 楠岃瘉鐮佸浘鐗囧瓧浣撳ぇ灏�
	 * 榛樿17
	 */
	private int fontsize = 21;
	/**
	 * 楠岃瘉鐮佸浘鐗囧搴�
	 */
	private int width = (fontsize+1)*vcodeLen+10;
	/**
	 * 楠岃瘉鐮佸浘鐗囬珮搴�
	 */
	private int height = fontsize+12;
	/**
	 * 骞叉壈绾挎潯鏁�
	 * 榛樿3鏉�
	 */
	private int disturbline = 3;
	
	
	public VCodeGenerator(){}
	
	/**
	 * 鎸囧畾楠岃瘉鐮侀暱搴�
	 * @param vcodeLen 楠岃瘉鐮侀暱搴�
	 */
	public VCodeGenerator(int vcodeLen) {
		this.vcodeLen = vcodeLen;
		this.width = (fontsize+1)*vcodeLen+10;
	}
	
	/**
	 * 鐢熸垚楠岃瘉鐮佸浘鐗�
	 * @param vcode 瑕佺敾鐨勯獙璇佺爜
	 * @param drawline 鏄惁鐢诲共鎵扮嚎
	 * @return
	 */
	public BufferedImage generatorVCodeImage(String vcode, boolean drawline){
		//鍒涘缓楠岃瘉鐮佸浘鐗�
		BufferedImage vcodeImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = vcodeImage.getGraphics();
		//濉厖鑳屾櫙鑹�
		g.setColor(new Color(246, 240, 250));
		g.fillRect(0, 0, width, height);
		if(drawline){
			drawDisturbLine(g);
		}
		//鐢ㄤ簬鐢熸垚浼殢鏈烘暟
		Random ran = new Random();
		//鍦ㄥ浘鐗囦笂鐢婚獙璇佺爜
		for(int i = 0;i < vcode.length();i++){
			//璁剧疆瀛椾綋
			g.setFont(new Font(fontNames[ran.nextInt(fontNames.length)], fontStyles[ran.nextInt(fontStyles.length)], fontsize));
			//闅忔満鐢熸垚棰滆壊
			g.setColor(getRandomColor());
			//鐢婚獙璇佺爜
			g.drawString(vcode.charAt(i)+"", i*fontsize+10, fontsize+5);
		}
		//閲婃斁姝ゅ浘褰㈢殑涓婁笅鏂囦互鍙婂畠浣跨敤鐨勬墍鏈夌郴缁熻祫婧�
		g.dispose();
		
		return vcodeImage;
	}
	
	/**
	 * 鑾峰緱鏃嬭浆瀛椾綋鐨勯獙璇佺爜鍥剧墖
	 * @param vcode
	 * @param drawline 鏄惁鐢诲共鎵扮嚎
	 * @return
	 */
	public BufferedImage generatorRotateVCodeImage(String vcode, boolean drawline){
		//鍒涘缓楠岃瘉鐮佸浘鐗�
		BufferedImage rotateVcodeImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2d = rotateVcodeImage.createGraphics();
		//濉厖鑳屾櫙鑹�
		g2d.setColor(new Color(246, 240, 250));
		g2d.fillRect(0, 0, width, height);
		if(drawline){
			drawDisturbLine(g2d);
		}
		//鍦ㄥ浘鐗囦笂鐢婚獙璇佺爜
		for(int i = 0;i < vcode.length();i++){
			BufferedImage rotateImage = getRotateImage(vcode.charAt(i));
			g2d.drawImage(rotateImage, null, (int) (this.height * 0.7) * i, 0);
		}
		g2d.dispose();
		return rotateVcodeImage;
	}
	/**
	 * 鐢熸垚楠岃瘉鐮�
	 * @return 楠岃瘉鐮�
	 */
	public String generatorVCode(){
		int len = code.length;
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		for(int i = 0;i < vcodeLen;i++){
			int index = ran.nextInt(len);
			sb.append(code[index]);
		}
		return sb.toString();
	}
	/**
	 * 涓洪獙璇佺爜鍥剧墖鐢讳竴浜涘共鎵扮嚎
	 * @param g 
	 */
	private void drawDisturbLine(Graphics g){
		Random ran = new Random();
		for(int i = 0;i < disturbline;i++){
			int x1 = ran.nextInt(width);
			int y1 = ran.nextInt(height);
			int x2 = ran.nextInt(width);
			int y2 = ran.nextInt(height);
			g.setColor(getRandomColor());
			//鐢诲共鎵扮嚎
			g.drawLine(x1, y1, x2, y2);
		}
	}
	/**
	 * 鑾峰彇涓�寮犳棆杞殑鍥剧墖
	 * @param c 瑕佺敾鐨勫瓧绗�
	 * @return
	 */
	private BufferedImage getRotateImage(char c){
		BufferedImage rotateImage = new BufferedImage(height, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g2d = rotateImage.createGraphics();
		//璁剧疆閫忔槑搴︿负0
		g2d.setColor(new Color(255, 255, 255, 0));
		g2d.fillRect(0, 0, height, height);
		Random ran = new Random();
		g2d.setFont(new Font(fontNames[ran.nextInt(fontNames.length)], fontStyles[ran.nextInt(fontStyles.length)], fontsize));
		g2d.setColor(getRandomColor());
		double theta = getTheta();
		//鏃嬭浆鍥剧墖
		g2d.rotate(theta, height/2, height/2);
		g2d.drawString(Character.toString(c), (height-fontsize)/2, fontsize+5);
		g2d.dispose();
		
		return rotateImage;
	}
	/**
	 * @return 杩斿洖涓�涓殢鏈洪鑹�
	 */
	private Color getRandomColor(){
		Random ran = new Random();
		return new Color(ran.nextInt(220), ran.nextInt(220), ran.nextInt(220)); 
	}
	/**
	 * @return 瑙掑害
	 */
	private double getTheta(){
		return ((int) (Math.random()*1000) % 2 == 0 ? -1 : 1)*Math.random();
	}

	/**
	 * @return 楠岃瘉鐮佸瓧绗︿釜鏁�
	 */
	public int getVcodeLen() {
		return vcodeLen;
	}
	/**
	 * 璁剧疆楠岃瘉鐮佸瓧绗︿釜鏁�
	 * @param vcodeLen
	 */
	public void setVcodeLen(int vcodeLen) {
		this.width = (fontsize+3)*vcodeLen+10;
		this.vcodeLen = vcodeLen;
	}
	/**
	 * @return 瀛椾綋澶у皬
	 */
	public int getFontsize() {
		return fontsize;
	}
	/**
	 * 璁剧疆瀛椾綋澶у皬
	 * @param fontsize
	 */
	public void setFontsize(int fontsize) {
		this.width = (fontsize+3)*vcodeLen+10;
		this.height = fontsize+15;
		this.fontsize = fontsize;
	}
	/**
	 * @return 鍥剧墖瀹藉害
	 */
	public int getWidth() {
		return width;
	}
	/**
	 * 璁剧疆鍥剧墖瀹藉害
	 * @param width
	 */
	public void setWidth(int width) {
		this.width = width;
	}
	/**
	 * @return 鍥剧墖楂樺害
	 */
	public int getHeight() {
		return height;
	}
	/**
	 * 璁剧疆鍥剧墖楂樺害
	 * @param height 
	 */
	public void setHeight(int height) {
		this.height = height;
	}
	/**
	 * @return 骞叉壈绾挎潯鏁�
	 */
	public int getDisturbline() {
		return disturbline;
	}
	/**
	 * 璁剧疆骞叉壈绾挎潯鏁�
	 * @param disturbline
	 */
	public void setDisturbline(int disturbline) {
		this.disturbline = disturbline;
	}
	
}
