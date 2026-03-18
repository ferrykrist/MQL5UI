//+------------------------------------------------------------------+
//| Rectangle Label class definition                                 |
//+------------------------------------------------------------------+
class RectangleLabel
   {
private:
    string           _name; // Name of the rectangle label
    int              previousMouseState, mlbDownX, mlbDownY, mlbDownXDistance, mlbDownYDistance; // Mouse state tracking variables
    bool             movingState; // State for whether the object is moving
    string           addedNames[]; // Array of added names
    long              addedXDisDiffrence[], addedYDisDiffrence[]; // Arrays to store added distance differences

public:
                     RectangleLabel(void); // Constructor
                    ~RectangleLabel(void); // Destructor
                    
    void             Create(string name, int xDis, int yDis, int xSize, int ySize); // Create method for rectangle label

    void             Destroy() {ObjectDelete(0, _name);} // Destroy method for rectangle label

    void             SetBorderType(ENUM_BORDER_TYPE borderType) {ObjectSetInteger(0, _name, OBJPROP_BORDER_TYPE, borderType);} // Method to set the border type

    void             SetBGColor(color col) {ObjectSetInteger(0, _name, OBJPROP_BGCOLOR, col);} // Method to set the background color

    void             OnEvent(int id, long lparam, double dparam, string sparam); // Event handler method
    
    void             Add(string name); // Method to add a name to the object
   };

//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
RectangleLabel::RectangleLabel(void)
   {
   }

//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
RectangleLabel::~RectangleLabel(void)
   {
   }

//+------------------------------------------------------------------+
//| Method to create a rectangle label                               |
//+------------------------------------------------------------------+
void RectangleLabel::Create(string name, int xDis, int yDis, int xSize, int ySize)
   {
    // Object creation and property settings
    ObjectCreate(0, name, OBJ_RECTANGLE_LABEL, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, xDis);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, yDis);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, xSize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE, ySize);
    _name = name;
   }

//+------------------------------------------------------------------+
//| Event handling for mouse movements                               |
//+------------------------------------------------------------------+
void RectangleLabel::OnEvent(int id, long lparam, double dparam, string sparam)
   {
    // Handle mouse movement events for dragging the rectangle label
    if(id == CHARTEVENT_MOUSE_MOVE)
       {
        int X = (int)lparam;
        int Y = (int)dparam;
        int MouseState = (int)sparam;

        string name = _name;
        int XDistance = (int)ObjectGetInteger(0, name, OBJPROP_XDISTANCE);
        int YDistance = (int)ObjectGetInteger(0, name, OBJPROP_YDISTANCE);
        int XSize = (int)ObjectGetInteger(0, name, OBJPROP_XSIZE);
        int YSize = (int)ObjectGetInteger(0, name, OBJPROP_YSIZE);

        if(previousMouseState == 0 && MouseState == 1)
           {
            mlbDownX = X;
            mlbDownY = Y;
            mlbDownXDistance = XDistance;
            mlbDownYDistance = YDistance;

            if(X >= XDistance && X <= XDistance + XSize && Y >= YDistance && Y <= YDistance + YSize)
               {
                movingState = true;
               }

           }

        if(movingState)
           {
            ChartSetInteger(0, CHART_MOUSE_SCROLL, false);
            ObjectSetInteger(0, name, OBJPROP_XDISTANCE, mlbDownXDistance + X - mlbDownX);
            ObjectSetInteger(0, name, OBJPROP_YDISTANCE, mlbDownYDistance + Y - mlbDownY);
            for(int i = 0; i < ArraySize(addedNames); i++)
               {
                ObjectSetInteger(0, addedNames[i], OBJPROP_XDISTANCE, mlbDownXDistance + X - mlbDownX - addedXDisDiffrence[i]);
                ObjectSetInteger(0, addedNames[i], OBJPROP_YDISTANCE, mlbDownYDistance + Y - mlbDownY - addedYDisDiffrence[i]);
               }
            ChartRedraw(0);
           }

        if(MouseState == 0)
           {
            movingState = false;
            ChartSetInteger(0, CHART_MOUSE_SCROLL, true);
           }

        previousMouseState = MouseState;
       }
   }

//+------------------------------------------------------------------+
//| Method to add an object by name to the rectangle label           |
//+------------------------------------------------------------------+
void RectangleLabel::Add(string name)
   {
    // Add a new object by name to the rectangle label and track distances
    ArrayResize(addedNames, ArraySize(addedNames) + 1);
    ArrayResize(addedXDisDiffrence, ArraySize(addedXDisDiffrence) + 1);
    ArrayResize(addedYDisDiffrence, ArraySize(addedYDisDiffrence) + 1);
    
    addedNames[ArraySize(addedNames) - 1] = name;
    addedXDisDiffrence[ArraySize(addedXDisDiffrence) - 1] = ObjectGetInteger(0, _name, OBJPROP_XDISTANCE) - ObjectGetInteger(0, name, OBJPROP_XDISTANCE);
    addedYDisDiffrence[ArraySize(addedYDisDiffrence) - 1] = ObjectGetInteger(0, _name, OBJPROP_YDISTANCE) - ObjectGetInteger(0, name, OBJPROP_YDISTANCE);
   }
//+------------------------------------------------------------------+
