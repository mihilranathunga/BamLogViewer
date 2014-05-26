<!DOCTYPE html>
<html class="no-js"> 
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>BAM Dashboard - WSO2 Bam Log Client Logs</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
  <link href="../resources/css/bootstrap.css" rel="stylesheet">
  <link href="../resources/css/bootstrap-theme.css" rel="stylesheet">
  <link href="../resources/css/bootstrap-missing.css" rel="stylesheet"> 
  <link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  

  <style>
  body {
    padding-top: 50px;
    padding-bottom: 20px;
    }.pagination-centered {
      text-align: center;
    }
    </style>

    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="../resources/font-awesome/css/font-awesome.min.css">
    <script src="../resources/js/vendor/jquery-1.10.1.min.js"></script>
  </head>

  <body>


    <div id="wrap">
      <div class="navbar navbar-inverse navbar-fixed-top main-menu">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../../../carbon"><img src="logo-inside.png"/>
            </a>
          </div>
          <div class="navbar-collapse collapse main-menu-inside">
            <ul class="nav navbar-nav pull-left menu1" id="leftnav"></ul>
          </div>
          <!--/.navbar-collapse -->
        </div>
        <div class="breadcrumb-strip">
          <div class="container">
            <!-- Example row of columns -->
                <!-- div class="row">
                    <div class="col-lg-12">

                        <ul class="breadcrumb pull-left">
                            <li><a href="../../../carbon">BAM Console</a> <span class="divider"></span></li>
                            <li class="active">WSO2 Private PaaS Logs</li>
                        </ul>
                       
                    </div>
                  </div -->
                </div>
              </div>
            </div>

            <div class="container content-starter">
              <div class="row">
                <div class="col-lg-12">

                </div>
              </div>
            </div>

            <div class="container">
              <div class="row">
                <div class="col-lg-12">


                  <!--img border="25%"  src="logo-inside.png" alt="WSO2 Private PAAS" align="left" -->  

                  <h1>BAM Log Client Logs</h1>

                  <div class="container content-section">



                    <div class="row">
                      <div class="well topFilteringPanel">
                       <div class="col-lg-12">


                        <span class="span5">Select HostAddress :
                          <select id="cluster-dd" name="basic-combo">
                            <option>All</option>
                          </select>
                        </span>
                        &nbsp;&nbsp;&nbsp;

                        <span class="span5">Select FileKey :
                          <select id="type-dd" name="basic-combo">
                            <option>All</option>
                          </select>
                        </span>
                        
                        &nbsp;&nbsp;&nbsp;


                        <span class="span2">Limit :
                          <select id="limit-dd" name="basic-combo">
                            <option>Def</option>
                          </select>
                        </span>
                        
                        &nbsp;&nbsp;&nbsp;

                        <button id="clearSelectionBtn" class="btn btn-primary btn-small filter-btn">Clear</button>

                      </div>
                      <div class="col-lg-12">

                        <span id="date-select" class="span5">From Date and Time :
                          <div id="datetimepicker1" class="input-append">
                            <input id="from-time" type="text"></input>
                            <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                              </i>
                            </span>
                          </div>
                        </span>
                        &nbsp;&nbsp;&nbsp;
                        <span id="date-select" class="span5">To Date and Time :
                          <div id="datetimepicker2" class="input-append">
                            <input id="to-time" type="text"></input>
                            <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar">
                              </i>
                            </span>
                          </div>
                        </span>
                        &nbsp;&nbsp;&nbsp;

                        <button id="submitBtn" class="btn btn-primary btn-small filter-btn">Submit</button>

                      </div>
                    </div>
                  </div>
                </div>


                <div class="row" style="min-height:700px">
                  <div class="col-lg-12">
                    <iframe style="min-height:1200px" id="dashboardWidget-2" src="gadgets/log-viewer.jag?filekey=All&hostIP=All&fromTime=All&toTime=All" class="single-column-gadget"></iframe>
                  </div>
                </div>

                <!--div class="pagination-centered">
                  <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div-->

              </div>
            </div>

          </div>
          <!-- /container -->
          <div id="push"></div>
        </div>


        <footer id="footer">
          <div class="container">
            <p class="muted credit">&copy; WSO2 2014</p>
          </div>
        </footer>

        <input type="hidden" id="resource_type" value="Endpoint"/>
        <input type="hidden" name="tenantId" id="tenantId" value= "<%=  session.getAttribute( "tenantId" )%>"/>
        <input type="hidden" name="domainId" id="domainId" value= "<%=  session.getAttribute( "domain" )%>"/>




        <script src="../resources/js/vendor/bootstrap.min.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-datetimepicker.min.js"></script>
        <script src="../resources/js/vendor/jquery.validate.min.js"></script>
        <script type="text/javascript" src="../resources/js/bamdashboard.js"></script>
        <script type="text/javascript" src="scripts/bam.dashboard.main.js"></script>
        <script type="text/javascript">
        var currentTab = "WSO2 Private PAAS Metering";
        </script>
        <script type="text/javascript" src="../navigation.populator.js"></script>
      </body>
      </html>