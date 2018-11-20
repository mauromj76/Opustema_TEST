<%-- 
    Sezione HEAD di HTML comune a tutte le pagine

    Deve essere caricata subito dopo il tag HEAD
--%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->        

<!--Tag libraries-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--CSRF prevention head tag for Ajax-->
<sec:csrfMetaTags />

<!--JQuery-->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--Validation library-->
<script src='<c:url value="/web-resources/js/validation/validate-library-1.0.0.js"/>'></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!--Bootstrap Date Picker-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/css/bootstrap-datepicker3.css"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- CSS booking online -->
<link rel="stylesheet" href='<c:url value="/web-resources/css/layout/bol.css"/>'>
<link rel="stylesheet" href='<c:url value="/web-resources/css/layout/opustema.css"/>'>
<link rel="stylesheet" href='<c:url value="/web-resources/css/layout/messages.css"/>'>

<!--Bootstrap date picker-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.1/locales/bootstrap-datepicker.it.min.js"></script>

<!--Angular JS-->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>

<!--Roboto font-->
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>

<!-- Twitter Bootstrap CSS: -->
<!--<link rel="stylesheet" type="text/css" href="docs/css/bootstrap.css">-->
 
<!--<script type="text/javascript" src="docs/js/jquery.js"></script>-->
<!--<script type="text/javascript" src="docs/js/bootstrap.js"></script>-->
<script type="text/javascript" src="/web-resources/password-score/dist/js/password-score.js"></script>
<script type="text/javascript" src="password-score/dist/js/password-score-options.js"></script>
<script type="text/javascript" src="dist/js/bootstrap-strength-meter.js"></script>

<link rel="shortcut icon" href="<c:url value='/web-resources/images/icone/favicon.ico'/>" type="image/x-icon">