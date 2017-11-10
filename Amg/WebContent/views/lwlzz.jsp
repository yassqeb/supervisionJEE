<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PARC </title>
<link rel="stylesheet" type="text/css" href="boots/css/bootstrap.css"/>


<link rel="stylesheet" type="text/css" href="css/tabzz.css"/>
<script type="text/javascript">

$(window).on("load resize ", function() {
	  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
	  $('.tbl-header').css({'padding-right':scrollWidth});
	}).resize();


</script>


<script type="text/javascript">
	function confirmation(id){
		var conf=confirm("etes vous sur de vouloir confirmer");
		if (conf==true)
			document.location="controleur.lwlz?action=supp&id="+id;	
	}
</script>

</head>
	<body>


<section>
 
  <!-- <h1>PARC INFO</h1> -->
  
  <h1><span class="blue">&lt;</span>PARC<span class="blue">&gt;</span> <span class="yellow">INFORMATIQUE</pan></h1>

  
    <table class="container">
      <thead>
        <tr>
          <th>ID</th>
          <th>IP</th>
          <th>Salle</th>
          <th>Etage</th>
          
          <th colspan="2">Action </th>
        </tr>
      </thead>
    
  
  
      <tbody>
        <c:forEach items="${machines}" var="m">
				 <tr>
					 <td>${m.idMachine }</td>
					 <td>${m.ipadr }</td>
					 <td>${m.salle }</td>
					 <td>${m.etage }</td>
					 <td><a class="btn btn-danger" href="javascript:confirmation('${m.idMachine }')">supp</a></td>
					 
					 <td><a class="btn btn-warning" href="views/machinz.jsp?action=edit&id=${m.idMachine }">edit</a></td>
				 </tr>
				 </c:forEach>				
      </tbody>
    </table>
  
</section>


<div class="made">
  Made by
  LWLZ
</div>


	</body>
</html>