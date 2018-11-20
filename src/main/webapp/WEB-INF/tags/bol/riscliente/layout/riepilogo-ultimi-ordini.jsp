    <div class="border-div">
        <h2>Ultimi ordini inseriti</h2>

        <c:if test="${ultimiOrdini.size()>0}">
            <table class="table">
                <thead>
                    <tr>
                        <td>
                            <b>Numero</b>
                        </td>
                        <td>
                            <b>Data</b>
                        </td>
                        <td>
                            <b>Tipo</b>
                        </td>
                        <td>
                            <b>Fattura</b>
                        </td>
                        <td>
                            <b>Importo</b>
                        </td>
                        <td>
                            <b>Gestisci</b>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ultimiOrdini}" var="ordine" varStatus="loopCounter" end="5">
                        <tr>
                            <td class="row">
                                <h4><c:out value="${ordine.id}"/></h4>
                            </td>
                            <td class="row">
                                <h4><small><fmt:formatDate pattern="dd/MM/YYYY" value="${ordine.data}"/></small></h4>
                            </td>
                            <td class="row">
                                <p><c:out value="${ordine.tipo}" /></p>
                            </td>
                            <td class="row">
                                <a href="#">
                                    <img src='<c:url value="/web-resources/css/images/file_extension_pdf.ico"/>'/>

                                </a>
                                <p>346/2016</p>
                            </td>
                            <td class="row">
                                <h3><c:out value="${ordine.importoEuro}"/>&euro;</h3>
                            </td>
                            <td class="row"> 
                                <a href="#">Visualizza</a>
                                <div class="divider-buttons"></div>
                                <a href="#">Modifica</a>
                                <div class="divider-buttons"></div>
                                <a href="#">Annulla</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${ultimiOrdini.size()==0}">

            <h2>
                Non ci sono ordini da visualizzare.
            </h2>

        </c:if>
    </div>