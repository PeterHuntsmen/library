//��֤�û���¼�ǿ�
function checklogin()
{
	
	var username = document.f1.username.value;
	var ps = document.f1.password.value;
	
	if(username==""){
		alert("����Ա�˺Ų���Ϊ��");
		document.f1.username.focus();
		return false;
	}
	if(ps==""){
		alert("�����Ϊ��");
		document.f1.password.focus();
		return false;
	}
	return true;
}
//��֤���ߵ�¼�ǿ�
function checkreader()
{
	
	var name = document.f1.name.value;
	var readerid = document.f1.readerid.value;
	
	
	if(name==""&&readerid==""){
		alert("����д���߱�Ż�����");
		document.f1.readerid.focus();
		return false;
	}
	return true;
}

//ͼƬ�ı�
function  photochange()
{
  var photo=document.f1.file1.value;
  document.f1.photo.value=photo;
  
  document.f1.img1.src=photo;
  }    
  function  photochange2()
{
  var photo=document.f1.photo.value;
    
  document.f1.img1.src=photo;
  }    
//��֤ͼ����ĺ���
function check()
{
	  String.prototype.lenB   =   function(){return   this.replace(/[^\x00-\xff]/g,"**").length;}
	var name = document.f1.bookname.value;
	var ISBN = document.f1.ISBN.value;
	var price= document.f1.price.value;
	var author=document.f1.author1.value;
	if(name==""){
		alert("��������Ϊ��");
		document.f1.bookname.focus();
		return false;
	}
	if(name.lenB()>20){
		alert("�������ܳ���10������");
		document.f1.bookname.focus();
		return false;
	}
	if(author==""){
		alert("������дһλ����");
		document.f1.author1.focus();
		return false;
	}
	 var pubdate=document.f1.pubdate.value;
	 if (pubdate!="")
	 {
	if (!formatTime(f1.pubdate.value))
 {
    alert("���ڸ�ʽ����");
    f1.pubdate.focus();
    return false;
     } 
     }
     if(price==""){
		alert("�۸���Ϊ��");
		document.f1.price.focus();
		return false;
	}
	if(isNaN(price)){
	      alert("�۸����������");
	document.f1.price.focus();
		return false;
	}
	
	if(ISBN==""){
		alert("ISBN����Ϊ��");
		document.f1.ISBN.focus();
		return false;
	}
	if(ISBN.length>17){
		alert("ISBN���Ȳ��ܳ���17λ");
		document.f1.ISBN.focus();
		return false;
	}
	     
	var bc = document.f1.bookclass;
	var dg2 = true;
	for(var j=0;j<bc.options.length;j++){
	if(bc.options[j].value!="" && bc.options[j].selected){
		dg2 = false;
	}
	}
	if(dg2){
		alert("��ѡ��ѧ�Ʒ���");
		document.f1.bookclass.focus();
		return false;
	}
	
	var type = document.f1.booktype;
	var dg = true;
	for(var i=0;i<type.options.length;i++){
	if(type.options[i].value!="" && type.options[i].selected){
		dg = false;
	}
	}
	if(dg){
		alert("��ѡ��������");
		document.f1.booktype.focus();
		return false;
	}
	
    
	return true;
}
//��֤�û����ĺ���
function checkuser()
{
   String.prototype.lenB   =   function(){return   this.replace(/[^\x00-\xff]/g,"**").length;}
	
	var name = document.f1.name.value;
    var ps = document.f1.password.value;
    var ps2 = document.f1.password2.value;
	if(name==""){
		alert("�û�������Ϊ��");
		document.f1.name.focus();
		return false;
	}
	if(name.length>10){
		alert("�û������ܳ���10λ");
		document.f1.name.focus();
		return false;
	}
	if(name.lenB()>10){
		alert("�û������ܳ���5������");
		document.f1.name.focus();
		return false;
	}
	if(ps==""){
		alert("���벻��Ϊ��");
		document.f1.password.focus();
		return false;
	}
	if(ps.length>11){
		alert("���벻�ܳ���11λ");
		document.f1.password.focus();
		return false;
	}
	if(ps!=ps2)
	{
	alert("�����������벻һ��");
		document.f1.password2.focus();
		return false;
	}
	
   
	return true;
}
//��֤���ڸ�ʽ�ĺ���
function formatTime(str)
{

  var   r   =   str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);    
  if(r==null) return   false;    
  var  d=  new  Date(r[1],   r[3]-1,   r[4]);    
  return  (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);  

}
//��֤������ĺ���
function checkrule()
{   var num=document.f1.num.value;
	var type = document.f1.readertype;
	var dg = true;
	var overtime=document.f1.overtime.value;
	var days=document.f1.days.value;
	var renew=document.f1.renew.value;
	for(var i=0;i<type.options.length;i++){
	if(type.options[i].value!="" && type.options[i].selected){
		dg = false;
	}
	}
	if(dg){
		alert("��ѡ����߷���");
		document.f1.readertype.focus();
		return false;
	}
	var type = document.f1.booktype;
	var dg = true;
	for(var i=0;i<type.options.length;i++){
	if(type.options[i].value!="" && type.options[i].selected){
		dg = false;
	}
	}
	if(dg){
		alert("��ѡ��������");
		document.f1.booktype.focus();
		return false;
	}
   if(num==""){
		alert("��������Ϊ��");
		document.f1.num.focus();
		return false;
	}
	if(isNaN(num))
	{
	alert("����ֻ��Ϊ����");
		document.f1.num.focus();
		return false;
	}
	if(isNaN(days))
	{
	alert("����ֻ��Ϊ����");
		document.f1.days.focus();
		return false;
	}
	if(isNaN(renew))
	{
	alert("�������ֻ��Ϊ����");
		document.f1.renew.focus();
		return false;
	}
	if(isNaN(overtime))
	{
	alert("���ڷ���ֻ��Ϊ����");
		document.f1.overtime.focus();
		return false;
	}
	return true;
}