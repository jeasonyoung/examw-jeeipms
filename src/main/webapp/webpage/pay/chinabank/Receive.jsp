<%@page contentType="text/html; charset=UTF-8" language="java"%>
<jsp:useBean id="MD5" scope="request" class="beartool.MD5"/>
<%
//****************************************	// MD5��ԿҪ�������ύҳ��ͬ����Send.asp��� key = "test" ,�޸�""���� test Ϊ������Կ
											// �������û������MD5��Կ���½����Ϊ���ṩ�̻���̨����ַ��https://merchant3.chinabank.com.cn/
String key = "2dsfa9023Dfsd00vmba562";		// ��½��������ĵ�����������ҵ���B2C�����ڶ������������С�MD5��Կ���á�
											// ����������һ��16λ���ϵ���Կ����ߣ���Կ���64λ��������16λ�Ѿ��㹻��
//****************************************

	request.setCharacterEncoding("gbk");
  //��ȡ����
    String v_oid = request.getParameter("v_oid");		// ������
	String v_pmode = request.getParameter("v_pmode");		// ֧����ʽ����˵������"���г������ÿ�"
    String v_pstatus = request.getParameter("v_pstatus");	// ֧�������20֧����ɣ�30֧��ʧ�ܣ�
    String v_pstring = request.getParameter("v_pstring");	// ��֧�������˵�����ɹ�ʱ��v_pstatus=20��Ϊ"֧���ɹ�"��֧��ʧ��ʱ��v_pstatus=30��Ϊ"֧��ʧ��"
	String v_amount = request.getParameter("v_amount");		// ����ʵ��֧�����
    String v_moneytype = request.getParameter("v_moneytype");	// ����
	String v_md5str = request.getParameter("v_md5str");		// MD5У����
	String remark1 = request.getParameter("remark1");		// ��ע1
	String remark2 = request.getParameter("remark2");		// ��ע2

	String text = v_oid+v_pstatus+v_amount+v_moneytype+key;
	String v_md5text = MD5.getMD5ofStr(text).toUpperCase();
	out.println(v_md5str);
	out.println(text);
	out.println(v_md5text);
	if (v_md5str.equals(v_md5text))
	{
		if ("30".equals(v_pstatus))
		{
			out.print("֧��ʧ��");
		}else if ("20".equals(v_pstatus)){
			// ֧���ɹ����̻� �����Լ�ҵ������Ӧ�߼�����
			//�˴������̻�ϵͳ���߼����������жϽ��ж�֧��״̬�����¶���״̬�ȵȣ�......
			
			out.print("֧���ɹ�");
		}
	}else{
	    out.print("У��ʧ��,���ݿ���");
	}
%>