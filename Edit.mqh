//+------------------------------------------------------------------+
//| Edit class definition                                            |
//+------------------------------------------------------------------+
class Edit
   {
private:
    string           _name; // Name of the edit control
public:
                     Edit(void); // Constructor
                    ~Edit(void); // Destructor
                    
    void             Create(string name, int xDis, int yDis, int xSize, int ySize); // Method to create an edit control
    
    void             Destroy() {ObjectDelete(0, _name);} // Method to destroy an edit control
    
    void             SetBorderColor(color col) {ObjectSetInteger(0, _name, OBJPROP_BORDER_COLOR, col);} // Method to set the border color
    
    void             SetBGColor(color col) {ObjectSetInteger(0, _name, OBJPROP_BGCOLOR, col);} // Method to set the background color
    
    void             SetTextColor(color col) {ObjectSetInteger(0, _name, OBJPROP_COLOR, col);} // Method to set the text color
    
    void             SetText(string text) {ObjectSetString(0, _name, OBJPROP_TEXT, text);} // Method to set the text content
    
    string           GetText() {return ObjectGetString(0, _name, OBJPROP_TEXT);} // Method to retrieve the text content
   };

//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
Edit::Edit(void)
   {

   }

//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
Edit::~Edit(void)
   {

   }

//+------------------------------------------------------------------+
//| Method to create an edit control object                          |
//+------------------------------------------------------------------+
void Edit::Create(string name, int xDis, int yDis, int xSize, int ySize)
   {
    // Code to create edit control object, set its position, size, and assign its name
    ObjectCreate(0, name, OBJ_EDIT, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, xDis);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, yDis);
    ObjectSetInteger(0, name, OBJPROP_XSIZE, xSize);
    ObjectSetInteger(0, name, OBJPROP_YSIZE, ySize);
    _name = name;
   }
//+------------------------------------------------------------------+