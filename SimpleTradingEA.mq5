//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include <Trade/Trade.mqh>
CTrade trade;

#include "RectangleLabel.mqh"
RectangleLabel TitleBar; // Title bar object
RectangleLabel MainDashboardBody; // Main dashboard body object

#include "Label.mqh"
Label TitleText; // Label for title text
Label LotSizeText; // Label for Lot size text

#include "Edit.mqh"
Edit LotSize; // Edit field for Lot size

#include "Button.mqh"
Button BuyButton; // Buy button object
Button SellButton; // Sell button object

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
   {
    // Enables mouse move events on the chart
    ChartSetInteger(0, CHART_EVENT_MOUSE_MOVE, true);
    
    // Initialize and set properties for Title bar, main dashboard, and all other elements
    TitleBar.Create("TitleBar", 100, 100, 200, 20);
    TitleBar.SetBorderType(BORDER_FLAT);
    TitleBar.SetBGColor(C'27, 59, 146');

    MainDashboardBody.Create("MainDashboardBody", 100, 119, 200, 100);
    MainDashboardBody.SetBorderType(BORDER_FLAT);
    MainDashboardBody.SetBGColor(C'102, 152, 250');

    TitleText.Create("TitleText", 110, 101);
    TitleText.SetText("Simple Trading EA V1.0");
    TitleText.SetFontSize(10);
    TitleText.SetTextColor(clrWhite);

    LotSizeText.Create("LotSizeText", 110, 140);
    LotSizeText.SetText("Lot Size:");
    LotSizeText.SetFontSize(12);
    LotSizeText.SetTextColor(clrWhite);

    LotSize.Create("LotSize", 220, 140, 50, 20);
    LotSize.SetBorderColor(clrBlack);
    LotSize.SetBGColor(clrWhiteSmoke);
    LotSize.SetText("0.01");
    LotSize.SetTextColor(clrBlack);

    BuyButton.Create("BuyButton", 110, 180, 80, 25);
    BuyButton.SetBorderColor(clrBlack);
    BuyButton.SetText("Buy");
    BuyButton.SetBGColor(clrLime);

    SellButton.Create("SellButton", 210, 180, 80, 25);
    SellButton.SetBorderColor(clrBlack);
    SellButton.SetText("Sell");
    SellButton.SetBGColor(clrRed);
    
    // Add the other elements to the Central Element i.e. TitleBar object in this case
    TitleBar.Add("MainDashboardBody");
    TitleBar.Add("TitleText");
    TitleBar.Add("LotSizeText");
    TitleBar.Add("LotSize");
    TitleBar.Add("BuyButton");
    TitleBar.Add("SellButton");

    ChartRedraw(0); // Redraws the chart
    return(INIT_SUCCEEDED);
   }

//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
   {
    // Destroys all GUI objects
    TitleBar.Destroy();
    MainDashboardBody.Destroy();
    TitleText.Destroy();
    LotSizeText.Destroy();
    LotSize.Destroy();
    BuyButton.Destroy();
    SellButton.Destroy();
   }

//+------------------------------------------------------------------+
//|Chart event handling function                                     |
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam)
   {
    // Handles click events for Buy and Sell buttons and opens corresponding positions
    if(id == CHARTEVENT_OBJECT_CLICK)
       {
        double ask = SymbolInfoDouble(_Symbol, SYMBOL_ASK);
        double bid = SymbolInfoDouble(_Symbol, SYMBOL_BID);
        if(sparam == "BuyButton")
           {
            trade.PositionOpen(_Symbol, ORDER_TYPE_BUY, (double)LotSize.GetText(), ask, 0, 0);
           }
        if(sparam == "SellButton")
           {
            trade.PositionOpen(_Symbol, ORDER_TYPE_SELL, (double)LotSize.GetText(), bid, 0, 0);
           }
       }
    
    // Passes events to the TitleBar object
    TitleBar.OnEvent(id, lparam, dparam, sparam);
   }
//+------------------------------------------------------------------+
