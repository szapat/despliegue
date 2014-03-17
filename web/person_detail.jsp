<%@page import="es.javiergarbedo.addressbook.beans.Person"%>
<%@page import="es.javiergarbedo.addressbook.Main"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //En request se reciben los datos enviados desde Main
    Person person = (Person) request.getAttribute("person");
    String action = request.getParameter("action");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="contendor">
            <h1>Datos del contacto</h1>
            <!-- Se añade enctype="multipart/form-data" para la subida de archivos -->
            <form method="post" action="Main" name="datosform" enctype="multipart/form-data">
                <!--<form method="post" action="Main">-->
                <input type="hidden" name="id" value="<%=person.getId()%>">
                <table>
                    <tr><td>Nombre:</td><td> <input type="text" name="name" class="inputdetail" value="<%=person.getName()%>"></td></tr>
                    <tr><td>Apellidos:</td><td>  <input type="text" name="surnames" class="inputdetail" value="<%=person.getSurnames()%>"></td></tr>
                    <tr><td>Alias:</td><td>  <input type="text" name="alias" class="inputdetail" value="<%=person.getAlias()%>"></td></tr>
                    <tr><td>Email: </td><td> <input type="text" name="email" class="inputdetail" value="<%=person.getEmail()%>"></td></tr>
                    <tr><td>Teléfono:</td><td>  <input type="text" name="phone_number" class="inputdetail" value="<%=person.getPhoneNumber()%>"></td></tr>
                    <tr><td>Tlf.Móvil:</td><td>  <input type="text" name="mobile_number" class="inputdetail" value="<%=person.getMobileNumber()%>"></td></tr>
                    <tr><td>Dirección: </td><td> <input type="text" name="address" class="inputdetail" value="<%=person.getAddress()%>"></td></tr>
                    <tr><td>Código Postal:</td><td>  <input type="text" name="post_code" class="inputdetail" value="<%=person.getPostCode()%>"></td></tr>
                    <tr><td>Ciudad: </td><td> <input type="text" name="city" class="inputdetail" value="<%=person.getCity()%>"></td></tr>
                    <tr><td>Provincia:</td><td>  <input type="text" name="province" class="inputdetail" value="<%=person.getProvince()%>"></td></tr>
                    <tr><td>Pais:</td><td> <input type="text" name="country" class="inputdetail" value="<%=person.getCountry()%>"></td></tr>
                            <%
                                String strBirthDate = "";
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                if (person.getBirthDate() != null) {
                                    strBirthDate = dateFormat.format(person.getBirthDate());
                                }

                            %>
                    <tr><td>Fecha nacimiento: </td><td> <input type="text" name="birth_date" class="inputdetail" value="<%=strBirthDate%>"></td></tr>
                    <tr><td>Observaciones:</td><td>  <input type="text" name="comments" class="inputdetail" value="<%=person.getComments()%>"></td></tr>

                    <tr><td>Foto:</td><td> <br><img src='<%=Main.SAVE_DIR + "/" + person.getPhotoFileName()%>' width="128px">
                            <input type="checkbox" class="inputdetail" name="deletePhoto">Borrar foto (tendrá efecto después de guardar)<br>
                            <input type="file" class="inputdetail" name="photoFileName"></td></tr>
                    <tr><td></td><td>
                            <%  //Botón guardar para editar o insertar
                                if (action.equals(Main.ACTION_EDIT_REQUEST)) {

                                    out.print("<input type='hidden' name='action' value='" + Main.ACTION_EDIT_RESPONSE + "'>");
                            %>
                            <img src='img/acept.png' onclick="datosform.submit();"/>
                            <label>Guardar</label>
                            <%
                            } else if (action.equals(Main.ACTION_INSERT_REQUEST)) {%>
                            <img src='img/acept.png' onclick="datosform.submit();"/>
                            <label>Insertar</label>
                            <%
                                    out.print("<input type='hidden' name='action' value='" + Main.ACTION_INSERT_RESPONSE + "'>");
                                }
                            %>

                            </form>

                            <%-- Botón para Cancelar cambios.
                                Para que se muestre de nuevo la lista no hay que indicar 
                                ninguna acción y volver a cargar Main --%>
                            <form method="post" action="Main" name="backfrom">
                                <input type="hidden" name="action" value="">
                                <img src='img/back.png' onclick="backfrom.submit();"/>
                                <label>Volver</label>       
                            </form></td></tr>
                    </div>
                    </body>
                    </html>
