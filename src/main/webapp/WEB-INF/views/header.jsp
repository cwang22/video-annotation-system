<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<c:url value="/resources/assets/ico/favicon.ico"/>">

    <title>Video Annoatation System</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/assets/css/bootstrap.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/assets/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/resources/assets/js/modernizr.js"/>"></script>
     <link href="<c:url value="/resources/assets/css/custom.css"/>" rel="stylesheet">
     
    <!-- Video.js -->
    <link href="//vjs.zencdn.net/4.7/video-js.css" rel="stylesheet">
	<script src="//vjs.zencdn.net/4.7/video.js"></script>
  </head>

  <body>

    <!-- Fixed navbar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/va/">VIDEO ANNOTATION SYSTEM</a>
        </div>
        <div class="navbar-collapse collapse navbar-right">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.html">VIDEO</a></li>
            <li><a href="about.html">MY ANNOTATION</a></li>
            <li><a href="contact.html">ABOUT</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">USERS<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="blog.html">MY PROFILE</a></li>
                <li><a href="single-post.html">SETTING</a></li>
                <li><a href="portfolio.html">LOG OUT</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>