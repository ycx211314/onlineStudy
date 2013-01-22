<%@page import="oracle.sql.CHAR"%><%@ page contentType="image/jpeg" import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%!
Color getRandColor(int fc,int bc){//��Χ��������ɫ
        Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
        }
%>
<%
//����ҳ�治����
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);

// ���ڴ��д���ͼ��
int width=60, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

// ��ȡͼ��������
Graphics g = image.getGraphics();

//��������
Random random = new Random();

// �趨����ɫ
g.setColor(getRandColor(200,250));
g.fillRect(0, 0, width, height);

//�趨����
g.setFont(new Font("Times New Roman",Font.PLAIN,18));

//���߿�
//g.setColor(new Color());
//g.drawRect(0,0,width-1,height-1);


// ������155�������ߣ�ʹͼ���е���֤�벻�ױ��������̽�⵽
g.setColor(getRandColor(160,200));
for (int i=0;i<155;i++)
{
	int x = random.nextInt(width);
	int y = random.nextInt(height);
        int xl = random.nextInt(12);
        int yl = random.nextInt(12);
	g.drawLine(x,y,x+xl,y+yl);
}

// ȡ���������֤��(4λ����)
//String rand = request.getParameter("rand");
//rand = rand.substring(0,rand.indexOf("."));
String sRand="";

for (int i=0;sRand.length()<4;i++){
	int j=random.nextInt(75)+48;
	if(j>=58&&j<=64||j>=91&&j<=96){continue;}
    String rand=String.valueOf((char)j).toUpperCase();
    sRand+=rand;
    // ����֤����ʾ��ͼ����
    g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));//���ú����������ɫ��ͬ����������Ϊ����̫�ӽ�����ֻ��ֱ�����
    g.drawString(rand,13*(sRand.length()-1)+6,16);
}
// ����֤�����SESSION
session.setAttribute("randcode",sRand);


// ͼ����Ч
g.dispose();

// ���ͼ��ҳ��
ImageIO.write(image, "JPEG", response.getOutputStream());
out.clear();
out = pageContext.pushBody();
%> 