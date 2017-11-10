
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PARC </title>
<link rel="stylesheet" type="text/css" href="boots/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<script type="text/javascript">
	function confirmation(id){
		var conf=confirm("etes vous sur de vouloir confirmer");
		if (conf==true)
			document.location="controleur.lwlz?action=supp&id="+id;	
	}
</script>

<style type="text/css">
	label{width: 100%;}
	input{width: 100%; text-align: center;display: block;}
</style>
</head>
	<body>
		<div class="container">  				
			<form action="controleur.lwlz" method="post">			
				<div class="form-group">
				<!-- <label for="idMachine"> ID :</label> -->
					${machine.idMachine }<input type ="hidden" name="idMachine" id="idMachine" value="${machine.idMachine }">
											
					<label for="ipadr" > IP :
						<input class="form-control-sm" type ="text" name="ipadr" id="ipadr" value=" ${m.ipadr}" placeholder="Saisir une IP">
					</label></br>
					
					<label for="salle"> Salle :
						<input class="form-control-sm" type ="text" name="salle" id="salle" value="${machine.salle}" placeholder="Saisir une salle">
					</label></br>
					
					<label for="etage"> Etage :
						<input class="form-control-sm" type ="text" name="etage" id="etage"value="${machine.etage}" placeholder="Saisir un étage">
					</label>
	
					<c:if test="${machine==null}">
					<input class="btn btn-success" type="submit" name="action" value="ajouter">
					</c:if>
					
					<c:if test="${machine!=null}">
					<input type="submit" name="action" value="update">
					</c:if>
				</div>				
			</form>	
			 <table class="table table-striped table-bordered table-hover table-responsive">
				 <tr class="table-primary">
				 	<th>ID</th>
				 	<th>IP Machine</th>
				 	<th>Salle</th>
				 	<th>Etage </th>
				 	<th colspan="2">Action </th>				 
				 </tr>
				 <c:forEach items="${machines}" var="m">
				 <tr>
					 <td>${m.idMachine }</td>
					 <td>${m.ipadr }</td>
					 <td>${m.salle }</td>
					 <td>${m.etage }</td>
					 <td><a class="btn btn-danger" href="javascript:confirmation('${m.idMachine }')">supp</a></td>
					 
					 <td><a class="btn btn-warning" href="controleur.lwlz?action=edit&id=${m.idMachine }">edit</a></td>
				 </tr>
				 </c:forEach>				 
			 </table>
	 </div>
	</body>
</html>