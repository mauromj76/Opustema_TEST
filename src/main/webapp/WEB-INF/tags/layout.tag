<%@tag pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/" var="root" scope="request"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/web-resources/css/pure-0.6.0.css'/>">
    <link rel="stylesheet" href="<c:url value='/web-resources/css/pure-responsive-0.6.0.css'/>">
    <link rel="stylesheet" href="<c:url value='/web-resources/css/main.css'/>">
    <%@attribute name="stylesheets" fragment="true"%>
    <jsp:invoke fragment="stylesheets"/>
  </head>
  <body>
  <div id="header">
    <div id="banner" class="pure-g padd">
      <div class="pure-u-7-8"><h1>Banner ipsum dolor sit amet.</h1></div>
      <div class="pure-u-1-8"><h1><a href="javascript:" id="main-menu-button" class="icon_menu right">|||</a></h1></div>
    </div>

    <div id="main-menu" class="pure-menu pure-menu-horizontal">
        <ul class="pure-menu-list left">
            <li class="pure-menu-item pure-menu-selected"><a href="<c:out value='${root}'/>new/main/" class="pure-menu-link">Hippokrates</a></li>
            <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                <a href="javascript:" class="pure-menu-link">Soggetti</a>
                <ul class="pure-menu-children">
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Paziente</a></li>
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Medico</a></li>
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Risorsa Umana</a></li>
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Tecnico</a></li>
                </ul>
            </li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Organizzazioni</a></li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Medici</a></li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Partizioni</a></li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link">Servizi</a></li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/booking/" class="pure-menu-link">Booking</a></li>
        </ul>
          <ul class="pure-menu-list right">
            <li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
                <a href="javascript:" class="pure-menu-link">IT</a>
                <ul class="pure-menu-children flags">
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link"><span class="flag_eng">EN</span></a></li>
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link"><span class="flag_ita">IT</span></a></li>
                    <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/manage/" class="pure-menu-link"><span class="flag_alb">AL</span></a></li>
                </ul>
            </li>
            <li class="pure-menu-item"><a href="<c:out value='${root}'/>new/login/" class="pure-menu-link">Login</a></li>
          </ul>
    </div>

  </div>

  <div id="content" class="pure-g padd">
    <jsp:doBody/>
  </div>

  <div id="footer" class="padd text-small">
    <%@attribute name="footer_content" fragment="true"%>
    <jsp:invoke fragment="footer_content"/>
    <p class="copy">&copy; Epistema Sh.P.K. All rights reserved. 2016</p>
  </div>

  <script type="text/javascript" src="<c:url value='/web-resources/js/jquery/jquery-1.10.2.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/web-resources/js/main.js'/>"></script>
  <%@attribute name="javascripts" fragment="true"%>
  <jsp:invoke fragment="javascripts"/>
  </body>
</html>
