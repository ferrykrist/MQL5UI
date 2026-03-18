//+------------------------------------------------------------------+
//| Button class definition                                          |
//+------------------------------------------------------------------+
class Button
   {
private:
    string           _name; // Name of the button control

public:
                     Button(void); // Constructor
                    ~Button(void); // Destructor
                    
    void             Create(string name, int xDis, int yDis, int xSize, int ySize); // Method to create a button control
    
    void             SetBorderColor(color col) {ObjectSetInteger(0, _name, OBJPROP_BORDER_COLOR, col);} // Method to set the border color
    
    void             SetBGColor(color col) {ObjectSetInteger(0, _name, OBJPROP_BGCOLOR, col);} // Method to set the background color
    
    void             SetText(string text) {ObjectSetString(0, _name, OBJPROP_TEXT, text);} // Method to set the text content
    
    void             Destroy() {ObjectDelete(0, _name);} // Method to destroy a button control
   };

//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
Button::Button(void)
   {

   }

//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
Button::~Button(void)
   {

   }

//+------------------------------------------------------------------+
//| Method to create a button control object                         |
//+------------------------------------------------------------------+
void Button::Create(string name, int xDis = 0, int yDis = 0, int xSize = 0, int ySize = 0)
   {
    // Code to create button control object, set its position, size, and assign its name
    ObjectCreate(0, name, OBJ_BUTTON, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, xDis);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, yDis);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, xSize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE, ySize);
    _name = name;
   }
//+------------------------------------------------------------------+
