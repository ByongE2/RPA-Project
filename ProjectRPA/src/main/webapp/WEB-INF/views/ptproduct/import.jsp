<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- �Ʒ� ���������� 1.0�̻��̸� ���ϴ� ������ ����ϼŵ� �����մϴ�. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
<script type="text/javascript">
$(document).ready(function(){
	   var pay = <%=bvo.getPay_coupon() %>;
	   console.log(pay);
	   	  
		var IMP = window.IMP;
		var code = "imp********"; //������ �ĺ��ڵ�
		IMP.init(code);
		
		$("#check1").click(function(e){
			//������û
			IMP.request_pay({
				//name�� amout���־ ���� ���డ��
				//pg : 'kakao', //pg�� ���� (kakao, kakaopay �Ѵ� ����)
				pay_method: 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '�����׽�Ʈ', // ��ǰ��
				amount : 1,
				buyer_email : '<%=email%>',
				buyer_name : '<%=mvo.getName()%>',
				buyer_tel : '<%= mvo.getPhone()%>',  //�ʼ��׸�
				//�����Ϸ��� �̵��� ������ kko�� kkopay�� ���� ����
				//m_redirect_url : 'https://localhost:8080/payments/complete'
			}, function(rsp){
				if(rsp.success){//���� ������
					var msg = '������ �Ϸ�Ǿ����ϴ�';
					var result = {
					"imp_uid" : rsp.imp_uid,
					"merchant_uid" : rsp.merchant_uid,
					"biz_email" : '<%=email%>',
					"pay_date" : new Date().getTime(),
					"amount" : rsp.paid_amount,
					"card_no" : rsp.apply_num,
					"refund" : 'payed'
					}
					console.log("�������� " + msg);
					$.ajax({
						url : '/samsam/insertPayCoupon.do', 
				        type :'POST',
				        data : JSON.stringify(result,
				        		['imp_uid', 'merchant_uid', 'biz_email', 
				        			'pay_date', 'amount', 'card_no', 'refund']),
				        contentType:'application/json;charset=utf-8',
				        dataType: 'json', //�������� ������ ������ Ÿ��
				        success: function(res){
				        			        	
				          if(res == 1){
							 console.log("�߰�����");	
							 pay += 5;
							 $('#pay_coupon').html(pay);			           
				          }else{
				             console.log("Insert Fail!!!");
				          }
				        },
				        error:function(){
				          console.log("Insert ajax ��� ����!!!");
				        }
					}) //ajax
					
				}
				else{//���� ���н�
					var msg = '������ �����߽��ϴ�';
					msg += '���� : ' + rsp.error_msg
				}
				console.log(msg);
			});//pay
		}); //check1 Ŭ�� �̺�Ʈ
		 
		$("#check2").click(function(e){
		      console.log("�����̿��"+$('#pay_coupon').text());
		      if($('#pay_coupon').text() >= 5){
			$.ajax({
					url: "/samsam/coupon_cancel.do",
					type:"post",
					//datatype:"json",
					contentType : 'application/x-www-form-urlencoded; charset = utf-8',
					data : {
						"biz_email" : '<%=email%>' // �ֹ���ȣ
						//"cancle_request_amount" : 2000, //ȯ�ұݾ�
						//"reason": "�׽�Ʈ ���� ȯ��", //ȯ�һ���
						//"refund_holder": "ȫ�浿", //[������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ������
						//"refund_bank":"88", //[������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� �����ڵ�(ex Kg�̴Ͻý��� ��� �������� 88)
						//"refund_account": "56211105948400" // [������� ȯ�ҽ� �ʼ��Է�] ȯ�� ������� ��ȣ
					}
				}).done(function(result){ //ȯ�� ����
					 pay -= 5;
					 $('#pay_coupon').html(pay);	
					console.log("ȯ�� ���� : "+ result);
				}).fail(function(error){
					console.log("ȯ�� ���� : "+ error);
				});//ajax
			} else{
				console.log("ȯ�� ���� : ���� ������ ȯ�� �Ұ�");
			}
		}); //check2 Ŭ��
	}); //doc.ready
</script>
</head>
<body>

<table class = pay border="1">
		<tr><td rowspan="2" class="pay_detail">�̿��</td><td>�� �⺻ ���� </td><td><%=bvo.getFree_coupon() %>/5</td></tr>
		<tr><td>���� ���� �̿�� Ƚ��</td><td id = "pay_coupon"><%=bvo.getPay_coupon() %> </td></tr>
	</table>
		
	<div class ="btns">
		<input type="button" id="check1" value="����">
		<input type="button" id="check2" value="ȯ��">
	</div>

</body>
</html>