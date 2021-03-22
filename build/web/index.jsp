<%-- Document : index Created on : 18 de mar. de 2021, 21:15:44 Author : wagner --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<% 
    String message = null, bissexto = null, teste = "CALENDARIO AQUI!";
    int diaOrdinal = 0, totalDiaMes = 0, dia = 1, ano = 0, mes = 1;
    String[] listaCalendario = new String[42];
    String[] listaMeses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
         "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
    String[][] calendario = new String[6][7];
    try {
        ano = Integer.parseInt(request.getParameter("ano"));
        mes = Integer.parseInt(request.getParameter("mes"));
        java.time.LocalDate local = java.time.LocalDate.of(ano, mes, dia);
        diaOrdinal = local.getDayOfWeek().ordinal();
        totalDiaMes = local.lengthOfMonth();
        bissexto = (local.isLeapYear()) ? "Sim" : "Não";
        dia = 1;

        for (int i = 0; i < listaCalendario.length; i++) {
            if (i > diaOrdinal && dia <= totalDiaMes) {
                listaCalendario[i] = String.valueOf(dia);
                dia++;
            } else {
                listaCalendario[i] = " ";
            }
        }
        dia = 0;
        for (int i = 0;
                i < calendario.length; i++) {
            for (int j = 0; j < calendario[i].length; j++) {
                calendario[i][j] = listaCalendario[dia];
                dia++;
            }
        }
    } catch (Exception ex) {
        message = "Insira os dados para gerar o calendário";
    }
%>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css">
        <title>Calendário</title>
    </head>

    <body>
        <header class="container-header">
            <h1>Wagner de Almeida</h1>
            <h2>RA: 1290481813036</h2>
        </header>
        <main class="container-main">

            <aside class="menu-left">
                <form method="post" class="form">
                    <label for="select-mes" class="label">Mês</label>
                    <select id="select-mes" name="mes" class="select">
                        <option value="1"> Janeiro </option>
                        <option value="2"> Fevereiro </option>
                        <option value="3"> Março </option>
                        <option value="4"> Abril </option>
                        <option value="5"> Maio </option>
                        <option value="6"> Junho </option>
                        <option value="7"> Julho </option>
                        <option value="8"> Agosto </option>
                        <option value="9"> Setembro </option>
                        <option value="10"> Outubro </option>
                        <option value="11"> Novembro </option>
                        <option value="12"> Dezembro </option>
                    </select>

                    <label for="input-ano" class="label">Ano</label>
                    <input class="input-number" id="input-ano" type="number" name="ano" required
                           min="-999999999" max="999999999">

                    <input type="submit" value="Gerar Calendário!">

                </form>
                <%if (message !=null) {%>
                <div class="intro">
                    <%= message%>
                </div>
                <%}%>
            </aside>

            <%if (message==null) {%>
            <div class="container-table">
                <div class="title-table">

                    <span>
                        <%=listaMeses[mes-1]%>
                    </span>
                    <span>
                        <%=ano%>
                    </span>
                    <span>Ano bissexto: <%=bissexto%></span>
                </div>
                <table>
                    <thead class="thead">
                        <tr>
                            <th>Domingo</th>
                            <th>Segunda</th>
                            <th>Terça</th>
                            <th>Quarta</th>
                            <th>Quinta</th>
                            <th>Sexta</th>
                            <th>Sábado</th>
                        </tr>
                    </thead>
                    <tbody class="tbody">
                        <%for (int i=0; i < calendario.length; i++) {%>
                        <tr>
                            <%for (int j=0; j < calendario[i].length; j++) {%>
                            <td>
                                <%= calendario[i][j]%>
                            </td>
                            <%}%>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
            <%}%>
        </main>
    </body>

</html>