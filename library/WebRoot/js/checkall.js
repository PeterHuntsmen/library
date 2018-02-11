//验证用户登录非空
function checklogin()
{
	
	var username = document.f1.username.value;
	var ps = document.f1.password.value;
	
	if(username==""){
		alert("管理员账号不能为空");
		document.f1.username.focus();
		return false;
	}
	if(ps==""){
		alert("口令不能为空");
		document.f1.password.focus();
		return false;
	}
	return true;
}
//验证读者登录非空
function checkreader()
{
	
	var name = document.f1.name.value;
	var readerid = document.f1.readerid.value;
	
	
	if(name==""&&readerid==""){
		alert("请填写读者编号或姓名");
		document.f1.readerid.focus();
		return false;
	}
	return true;
}

//图片改变
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
//验证图书表单的函数
function check()
{
	  String.prototype.lenB   =   function(){return   this.replace(/[^\x00-\xff]/g,"**").length;}
	var name = document.f1.bookname.value;
	var ISBN = document.f1.ISBN.value;
	var price= document.f1.price.value;
	var author=document.f1.author1.value;
	if(name==""){
		alert("书名不能为空");
		document.f1.bookname.focus();
		return false;
	}
	if(name.lenB()>20){
		alert("书名不能超过10个汉字");
		document.f1.bookname.focus();
		return false;
	}
	if(author==""){
		alert("至少填写一位作者");
		document.f1.author1.focus();
		return false;
	}
	 var pubdate=document.f1.pubdate.value;
	 if (pubdate!="")
	 {
	if (!formatTime(f1.pubdate.value))
 {
    alert("日期格式错误！");
    f1.pubdate.focus();
    return false;
     } 
     }
     if(price==""){
		alert("价格不能为空");
		document.f1.price.focus();
		return false;
	}
	if(isNaN(price)){
	      alert("价格必须是数字");
	document.f1.price.focus();
		return false;
	}
	
	if(ISBN==""){
		alert("ISBN不能为空");
		document.f1.ISBN.focus();
		return false;
	}
	if(ISBN.length>17){
		alert("ISBN长度不能超过17位");
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
		alert("请选择学科分类");
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
		alert("请选择藏书分类");
		document.f1.booktype.focus();
		return false;
	}
	
    
	return true;
}
//验证用户表单的函数
function checkuser()
{
   String.prototype.lenB   =   function(){return   this.replace(/[^\x00-\xff]/g,"**").length;}
	
	var name = document.f1.name.value;
    var ps = document.f1.password.value;
    var ps2 = document.f1.password2.value;
	if(name==""){
		alert("用户名不能为空");
		document.f1.name.focus();
		return false;
	}
	if(name.length>10){
		alert("用户名不能超过10位");
		document.f1.name.focus();
		return false;
	}
	if(name.lenB()>10){
		alert("用户名不能超过5个汉字");
		document.f1.name.focus();
		return false;
	}
	if(ps==""){
		alert("密码不能为空");
		document.f1.password.focus();
		return false;
	}
	if(ps.length>11){
		alert("密码不能超过11位");
		document.f1.password.focus();
		return false;
	}
	if(ps!=ps2)
	{
	alert("两次密码输入不一致");
		document.f1.password2.focus();
		return false;
	}
	
   
	return true;
}
//验证日期格式的函数
function formatTime(str)
{

  var   r   =   str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);    
  if(r==null) return   false;    
  var  d=  new  Date(r[1],   r[3]-1,   r[4]);    
  return  (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);  

}
//验证规则表单的函数
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
		alert("请选择读者分类");
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
		alert("请选择藏书分类");
		document.f1.booktype.focus();
		return false;
	}
   if(num==""){
		alert("册数不能为空");
		document.f1.num.focus();
		return false;
	}
	if(isNaN(num))
	{
	alert("册数只能为数字");
		document.f1.num.focus();
		return false;
	}
	if(isNaN(days))
	{
	alert("期限只能为数字");
		document.f1.days.focus();
		return false;
	}
	if(isNaN(renew))
	{
	alert("续借次数只能为数字");
		document.f1.renew.focus();
		return false;
	}
	if(isNaN(overtime))
	{
	alert("超期罚款只能为数字");
		document.f1.overtime.focus();
		return false;
	}
	return true;
}