<%@page import="java.net.InetAddress"%>
<%@page import="es.javiergarbedo.addressbook.beans.Person"%>
<%@page import="es.javiergarbedo.addressbook.Main"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div id="contendor" style="width: 850px;">
            <h1>Lista de contactos</h1>

            <%
                ArrayList<Person> personsList = (ArrayList) request.getAttribute("personsList");
                for (Person person : personsList) {
                    out.println("<table border='1'><tr><td rowspan='5'>");

                    out.println("<img src='" + Main.SAVE_DIR + "/" + person.getPhotoFileName() + "' width='128px' /></td>");

                    out.println("<td class='coltable'><b>" + person.getName() + "</b></td></tr>");
                    out.println("<tr><td class='coltable'><b>" + person.getSurnames() + "</b></td></tr>");
                    out.println("<tr><td class='coltable'>" + person.getEmail() + "</td></tr>");
                    out.println("<tr><td class='coltable'>" + person.getPhoneNumber() + "</td></tr>");
                    out.println("<tr><td class='coltable'>" + person.getMobileNumber() + "</td></tr>");
                    //Enlace para editar el registro
                    String editLink = "Main?action=E&id=" + person.getId();
                    out.println("<tr><td class='filabotones' colspan='2'><a href='" + editLink + "'><img src='img/edit.png'/></a>Editar");
                    //Enlace para eliminar el registro con confirmación por parte del usuario
                    String deleteLink = "Main?action=D&id=" + person.getId();
                    String deleteConfirmText = "Confirme que desea eliminar el contacto:\\n" + person.getName() + " " + person.getSurnames();
                    out.println("<a href='" + deleteLink + "' onCLick='return confirm(\"" + deleteConfirmText + "\")'><img src='img/delete.png'/></a>Suprimir");

                    out.println("</td></tr></table>");

                }
            %>

            <br>
            <table id="formulario_lista">
                <tr><td>
                        <form method="get" action="Main" name="formnuevo">
                            <input type="hidden" name="action" value="I">    
                            <img src='img/add.png' onclick="formnuevo.submit();"/>
                            <label>Nuevo Contacto</label>
                        </form>
                    </td><td>
                        <form method="get" action="Main" target="_blank" name="formxml">
                            <input type="hidden" name="action" value="X">
                            <img src='img/xml.gif' onclick="formxml.submit();"/>
                            <label>Exportar XML</label>            

                        </form>
                    </td></tr>
            </table>
            <br/>
            <br/>
                    <% 
            InetAddress address = InetAddress.getLocalHost();
            String sHostName;
            sHostName = address.getHostName(); 
            out.println("<h4>"+sHostName+"</h4>");
        %>
        </div>
    </body>
</html>
