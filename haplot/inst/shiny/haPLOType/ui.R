library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  style="padding-top: 150px;z-index: -1;",
  # Application title
  #titlePanel("Haplotype Viewer"), 
  absolutePanel(
    style="z-index:100",
    top = 0, left = 0, right = 0,
    fixed = TRUE,
    div(
      style="padding: 5px 5px 1px; border-bottom: 1px solid #CCC; background: #CFCFCD",
      fluidRow( 
        #         column(2,
        #                column(8,offset=2,"HapPLOType",style="margin-top:5%;font-family:helvetica; font-size:400%"),
        #                column(2)),
        column(12, 
               column(4, column(1,"Panel:",style="margin-top:20px; padding-left:0px; font-weight:bold"),
                      column(10,selectInput("selectDB", label ="","",selected = NULL,width="100%"),
                             style="padding-left:0px;margin-top:-10px;margin-bottom:-10px;",offset=1)),
               column(4, column(1,"Group:",style="margin-top:20px;font-weight:bold; padding-left:0px"),
                      column(9, selectInput("selectGroup", label ="","ALL",selected = "ALL"),
                             style="margin-top:-10px;margin-bottom:-10px;"),
                      column(1,actionButton("groupBack", label="<", width="80%"), 
                             style="margin-top:10px; padding: 0 0% 0 0%", offset=0),
                      column(1,actionButton("groupFor", label=">", width="80%"),
                             style="margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
                      style="padding-left:0px"),
               column(4, column(1,"Locus:",style="margin-top:20px;font-weight:bold; padding-left:0px"),
                      column(9, selectInput("selectLocus", label ="","ALL",selected = "ALL"),
                             style="margin-top:-10px;margin-bottom:-10px;"),
                      column(1,actionButton("locusBack", label="<", width="80%"), 
                             style="margin-top:10px; padding: 0 0% 0 0%", offset=0),
                      column(1,actionButton("locusFor", label=">", width="80%"),
                             style="margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
                      style="padding-left:0px")),
        #                column(4, column(1,"Indiv:",style="margin-top:20px;font-weight:bold; padding-left:0px"),
        #                       column(9, selectInput("selectIndiv", label ="","ALL",selected = "ALL"),
        #                              style="margin-top:-10px;margin-bottom:-10px;"),
        #                       column(1,actionButton("indivBack", label="<", width="80%"), 
        #                              style="margin-top:10px; padding: 0 0% 0 0%", offset=0),
        #                       column(1,actionButton("indivFor", label=">", width="98%"),
        #                              style="margin-top:10px;padding:0 0% 0 0%; margin-left: 0px;"),
        #                       style="padding-left:0px")),
        #         column(5,
        #                column(12,
        #                       column(1, "Panel:",style="margin-top:20px;font-weight:bold"),
        #                       column(11, selectInput("selectDB", label ="","",selected = NULL, width="100%"),
        #                              style="padding-right: 0px; margin-top:0%;padding-left:10%; padding-right: 0px;"),
        #                       style="padding-right: 0px; margin-top:0%;padding-left:0%; padding-right: 0px;
        #                       margin: -1% 0 0 0;"),
        #                               column(12, 
        #                                      column(1,"Locus:",style="margin-top:20px;font-weight:bold"),
        #                                      column(8,selectInput("selectLocus", label ="","ALL",selected = "ALL", width="90%"),
        #                                             style="padding-right: 0px; margin-top:0%;padding-left:10%; padding-right: 0px;"),
        #                                      column(1,actionButton("locusBack", label="<", width="80%"), 
        #                                             style="margin-top:20px; padding: 0 0% 0 0%", offset=1),
        #                                      column(1,actionButton("locusFor", label=">", width="80%"),
        #                                             style="margin-top:20px;padding:0 0% 0 0%; margin-left: 0px;"),
        #                                      style="padding-right: 0px;padding-left:0px; padding-right: 0px;margin: -3% 0 0 0;"),
        #                #column(1,actionButton("locusBack", label="<<"),style="margin-top:10%; padding-right: 0px;"),
        #                #column(1,actionButton("locusFor", label=">>"),style="margin-top:10%; padding-right: 0px;"),
        #                column(12, 
        #                       column(1,"Indiv:",style="margin-top:20px;font-weight:bold"),
        #                       column(8,selectInput("selectIndiv", label = "","ALL", selected = "ALL",width="90%"),
        #                              style="padding-right: 0px; margin-top:0.3%;padding-left:10%; padding-right: 0px;"),
        #                       column(1,actionButton("indivBack", label="<",width="80%"),
        #                              style="margin-top:20px; padding: 0 0% 0 0%", offset=1),
        #                       column(1,actionButton("indivFor", label=">",width="80%"),
        #                              style="margin-top:20px; padding: 0 0% 0 0%"),
        #                       style="padding: 0 0 0 0; margin: -3% 0 0 0;"
        #                ) 
        #         ),
        column(12,
               column(6, 
                      column(3,"Min read coverage:",style="margin-top:40px;font-weight:bold"),
                      column(3, sliderInput("coverageMin",
                                            "",
                                            min = 0,
                                            max = 200,
                                            value = 1)),
                      column(3,"Min allelic ratio:",style="margin-top:40px;padding-left:40px;font-weight:bold"),
                      column(3,sliderInput("minAlleleRatio",
                                           "",
                                           min = 0,
                                           max = 1,
                                           value = 0.2)),
                      style="padding: 0 0 0 0; margin: -1% 0 0 0;"),
               column(2,
                      #column(4, actionButton("updateFilter", label="Update"), style="margin-top:5%; padding-right: 0px;"),
                      #                       column(1,checkboxInput("filterCheck", label = "", value = FALSE),
                      #                       style="margin-top:10px;"),
                      #                       column(8,textInput("filter", label = "", value = "Enter filter...")),
                      column(12, actionButton("updateFilter", label="Update"), style="margin-top:20px; padding-right: 0px;")),
               #column(12, "Keep only the top 2 most common Haplotypes",style="margin-top:10px;font-weight:bold"),
               #column(12, h5("Post Filtered Table:"),downloadButton('downloadData', 'Download'), align="center",
               #offset=0,
               #style="padding: 0 0 0 0; margin: -3% 0 0 0;",
               #tags$style(type='text/css', "#downloadData { vertical-align:center; height: 40px;margin-top:0px;font-size:20px}")),
               #style="padding: 0 0 0 0; margin: 0% 0 0 0;")
               column(2, checkboxInput("topTwo", label = "Keeping only the top 2 common haplotypes", value = FALSE),
                      style="margin-top:10px;")
               
               
        )))),
  #hr(),
  #selectInput("selectLocus", label = "", 
  #            choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3), 
  #           selected = 1),
  #column(12, h1("")),
  fluidRow(#column(4,  column(3, h5("By Indiv:"), offset=0),
    #       column(9, h6(textOutput("indivSelect")), style="margin-left: 0px; color:grey")),
    column(4, column(3,h5("By Indiv:")),#style="margin-top:0px; padding-left:10px"),
           column(7, selectInput("selectIndiv", label ="","ALL",selected = "ALL"),
                  style="margin-top:-20px;margin-bottom:-10px;"),
           column(1,actionButton("indivBack", label="<", width="80%"), 
                  style="margin-top:0px; padding: 0 0% 0 0%", offset=0),
           column(1,actionButton("indivFor", label=">", width="98%"),
                  style="margin-top:0px;padding:0 0% 0 0%; margin-left: 0px;")),
    column(4, column(12, 
                     column(2,h6("Display: ")),
                     column(4,selectInput("indivPerDisplay", label = NULL, 
                                          choices = list("15"=15,
                                                         "30"=30,
                                                         "60"=60,
                                                         "ALL"=100),
                                          selected=15), offset=0),
                     column(5,h6("indiv per slide") ))),
    column(4, column(12, 
                     column(1,h6("Page:")),
                     column(4,numericInput("indivPage", label = NULL, value = 1, min=1, step=1),offset=1),
                     column(1, h6(" of ")),
                     column(1, h6(textOutput("maxIndivPage"))),
                     column(2, actionButton("updateIndivSizeDisplay", label="refresh"), offset=1)
    )),
    style="border-bottom: 2px dashed #d9d9d9;  margin-bottom: 5px; padding-top:15px"),
  #border-top: 2px dashed #d9d9d9;
  fluidRow( 
    column(5,plotOutput("AlleleRatioByIndiv",height="auto",
                        dblclick = dblclickOpts(
                          id = "plot_dblclick"),
                        brush = brushOpts(
                          id = "plot_brush",
                          direction = "y",
                          resetOnNew = TRUE))),
    column(2,plotOutput("fracHaploPlot",height="auto")),
    column(2,plotOutput("meanReadDepthByIndiv",height="auto")),
    column(3,plotOutput("readDepthByIndiv",height="auto"))),
  #   column(4,plotOutput("distPlot", 
  #                       dblclick = dblclickOpts(
  #                         id = "plot1_dblclick"),
  #                       brush = brushOpts(
  #                         id = "plot1_brush",
  #                         direction = "y",
  #                         resetOnNew = TRUE))),
  
  
  
  column(12, h1("")),
  br(),
  fluidRow(column(4,  column(3, h5("Locus:"), offset=0),
                  column(9, h5(textOutput("locusSelect")), style="margin-left: 0px; color:grey")),
           
           #            column(5,column(12,
           #                            column(2,h5("Locus:"),style="margin-top:0%;font-weight:bold"),
           #                            column(8,selectInput("selectLocus", label ="","ALL",selected = "ALL", width="90%"),
           #                                   style="padding-right: 0px; margin-top:-4%;padding-left:0%; padding-right: 0px;"),
           #                            column(1,actionButton("locusBack", label="<", width="80%"), 
           #                                   style="margin-top:0px; padding: 0 0% 0 0%", offset=0),
           #                            column(1,actionButton("locusFor", label=">", width="80%"),
           #                                   style="margin-top:0px;padding:0 0% 0 0%; margin-left: 0px;"))),
           #style="padding-right: 0px;padding-left:0px; padding-right: 0px;margin: -3% 0 0 0;")),
           column(4, column(12, 
                            column(2,h6("Display: ")),
                            column(4,selectInput("locusPerDisplay", label = NULL, 
                                                 choices = list("15"=15,
                                                                "30"=30,
                                                                "60"=60,
                                                                "ALL"=100),
                                                 selected=15), offset=0),
                            column(5,h6("locus per slide") ))),
           column(4, column(12, 
                            column(1,h6("Page:")),
                            column(4,numericInput("locusPage", label = NULL, value = 1, min=1, step=1),offset=1),
                            column(1, h6(" of ")),
                            column(1, h6(textOutput("maxlocusPage"))),
                            column(2, actionButton("updateLocusSizeDisplay", label="refresh"), offset=1)
           )),
           style="border-bottom: 2px dashed #d9d9d9; margin-bottom: 10px; padding-top: 5px"),
  fluidRow( 
    column(5,plotOutput("haplDensityPlot",height="auto",
                        dblclick = dblclickOpts(
                          id = "plotH_dblclick"),
                        brush = brushOpts(
                          id = "plotH_brush",
                          direction = "y",
                          resetOnNew = TRUE))),
    column(2,plotOutput("numHapPlot",height="auto")),
    column(2,plotOutput("fracIndivPlot",height="auto")),
    column(3, plotOutput("readDepthPerLocus",height="auto"))),
  
  #locus assessement panel
  
  
  
  
  
  
  fluidRow(column(4,  column(3, h5("Locus:"), offset=0),
                  column(9, h5(textOutput("locusSelect1")), style="margin-left: 0px; color:grey")),
           column(3, column(12, 
                            column(6,h5("Current status: ")),
                            column(6, h5(textOutput("locusAcceptStatus")), style="margin-left: 0px; color:grey"))),
           column(3, column(12, 
                            column(2, actionButton("acceptLocus", label="Accept", style="font-weight: bold"),offset=1),
                            column(2, actionButton("rejectLocus", label="Reject", style="font-weight: bold"),offset=4)
           )),
           style="border-bottom: 2px dashed #d9d9d9; border-top: 2px dashed #d9d9d9; margin-bottom: 5px; margin-top: 10px; padding-bottom: 15px; padding-top:15px"),
  fluidRow(column(4,plotOutput("hapSeq",height="auto")),
           column(4,plotOutput("histHap",height="auto")),
           column(4,plotOutput("PairWiseHap",height="auto")),
           column(12, plotOutput("hapByGroupPlot",height="auto"))),
  #   fluidRow(
  #     div(
  #       style="padding: 10px; border-bottom: 8px solid white; background: white"
  #     ),
  
  # group label panel
  fluidRow(
    column(4, column(3,h5("Group:")),
           column(9, h5(textOutput("groupSelect")), style="margin-left: 0px; color:grey")),
    style="border-bottom: 2px dashed #d9d9d9;  margin-bottom: 10px; padding-top:5px"),
  fluidRow( 
    column(3,plotOutput("nIndivByGroupPlot",height="auto")),
    column(3,plotOutput("fIndivByGroupPlot",height="auto")),
    column(3,plotOutput("nLociByGroupPlot",height="auto")),
    column(3, plotOutput("fLociByGroupPlot",height="auto"))),
  
  
  # table panel
  
  fluidRow(column(4,  
                  column(5, h5("Select Table:"), offset=0),
                  column(7, selectInput("selectTbl", label ="",c("observed variants","reported indiv haplotype","SNP report"),selected = "reported indiv haplotype"),
                         style="padding-right: 0px; margin-top:-20px;margin-bottom:-20px;padding-left:0%; padding-right: 0px;")),
           column(3, column(12,
                            column(6, actionButton('updateTable', 'Update')),
                            column(6,downloadButton('downloadData', 'Download')))),
           style="border-bottom: 2px dashed #d9d9d9; border-top: 2px dashed #d9d9d9; margin-bottom: 5px; margin-top: 10px; padding-bottom: 15px; padding-top:15px"),
  
  
  
  column(12, DT::dataTableOutput('haploTbl')),#,style="border-right:2px solid grey;"),
  #column(5, DT::dataTableOutput('haploFreqTbl'), offset=2),
  #column(12),
  #div(
  #  style="padding: 10px; border-bottom: 8px solid white; background: white"
  #),
  #column(4, DT::dataTableOutput('haploSummary')),
  titlePanel("", windowTitle = "HapPLOType: a view to your haplotypes")
  
))