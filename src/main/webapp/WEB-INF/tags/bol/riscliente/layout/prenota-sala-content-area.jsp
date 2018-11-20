<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>      

<div class="container-fluid">

    <div class="box-yellow">
        <h3>Messaggio pubblicitario/informativo</h3>
    </div>

    <h2>Roma: trovate 4 sale riunione</h2>

    <div class="border-div">
        <div class="row">
            <div class="col-xs-6 col-md-6 col-lg-6"  style="line-height:50px; margin-top: 10px; margin-bottom: 10px;">
                &nbsp;<b>Legenda:</b>
                <input type="checkbox" style="width: 25px; height: 25px; vertical-align: middle"> &nbsp;Disponibile
                <input type="checkbox" style="width: 25px; height: 25px; vertical-align:middle;" disabled="true"> &nbsp;Non Disponibile
            </div>
            <div class="col-xs-6 col-md-6 col-lg-6" style="line-height: 50px; margin-top:10px; margin-bottom: 10px;">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <b>Cambia Settimana</b>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <a href="#"><< Precedente</a>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <a href="#">Successiva >></a>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <a href="#">Seleziona</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>    
    <div class="border-div">
        <div class="row">
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <h3>Accademia Informatica s.r.l.</h3>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-top: 20px; margin-bottom: 10px;">
                    <h4>Roma - Viale Egeo - EUR</h4>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="margin-top: 20px; margin-bottom: 10px;text-align: right;">
                    <a href="#" class="btn btn-default">Prenota</a>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <td>

                            </td>
                            <td class="center">
                                lun 2/5
                            </td>
                            <td class="center">
                                mar 3/5
                            </td>
                            <td class="center">
                                mer 4/5
                            </td>
                            <td class="center">
                                giov 5/5
                            </td>
                            <td class="center">
                                ven 6/5
                            </td>
                            <td class="center">
                                sab 7/5
                            </td>
                            <td class="center">
                                dom 8/5
                            </td>

                        </tr>
                    </thead>

                    <c:forEach var="i" begin="1" end="10">
                        <tr>
                            <td class="center">
                                <fmt:formatNumber minIntegerDigits="2" value="${i+8}" />.00 - <c:out value="${i+9}"/>.00
                        </td>

                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

            </div>
        </div>
    </div>
    <br>
    <br>
    <div class="border-div">
        <div class="row">
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                    <h3>Nome struttura partner s.r.l.</h3>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-top: 20px; margin-bottom: 10px;">
                    <h4>Roma - Viale Egeo - EUR</h4>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="margin-top: 20px; margin-bottom: 10px;text-align: right;">
                    <a href="#" class="btn btn-default">Prenota</a>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <td>

                            </td>
                            <td class="center">
                                lun 2/5
                            </td>
                            <td class="center">
                                mar 3/5
                            </td>
                            <td class="center">
                                mer 4/5
                            </td>
                            <td class="center">
                                giov 5/5
                            </td>
                            <td class="center">
                                ven 6/5
                            </td>
                            <td class="center">
                                sab 7/5
                            </td>
                            <td class="center">
                                dom 8/5
                            </td>

                        </tr>
                    </thead>

                    <c:forEach var="i" begin="1" end="10">
                        <tr>
                            <td class="center">
                                <fmt:formatNumber minIntegerDigits="2" value="${i+8}" />.00 - <c:out value="${i+9}"/>.00
                        </td>

                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        <td class="selectable">

                        </td>
                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">

            </div>
        </div>
    </div>
</div>
<style>
    .table td.highlighted {
        border-color: #30437d;
        background-color: #30437d;
    }
</style>
<script>
    $(function () {
        var isMouseDown = false,
                isHighlighted;
        $(".table td.selectable")
                .mousedown(function () {
                    isMouseDown = true;
                    $(this).toggleClass("highlighted");
                    isHighlighted = $(this).hasClass("highlighted");
                    return false; // prevent text selection
                })
                .mouseover(function () {
                    if (isMouseDown) {
                        $(this).toggleClass("highlighted", isHighlighted);
                    }
                })
                .bind("selectstart", function () {
                    return false;
                })

        $(document)
                .mouseup(function () {
                    isMouseDown = false;
                });
    });
</script>