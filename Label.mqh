//+------------------------------------------------------------------+
//| Label class definition                                           |
//+------------------------------------------------------------------+
class Label
   {
private:
    string           _name; // Name of the label
public:
                     Label(void); // Constructor
                    ~Label(void); // Destructor
                    
    void             Create(string name, int xDis, int yDis); // Method to create a label
    
    void             Destroy() {ObjectDelete(0, _name);} // Method to destroy a label
    
    void             SetTextColor(color col) {ObjectSetInteger(0, _name, OBJPROP_COLOR, col);} // Method to set the text color
    
    void             SetText(string text) {ObjectSetString(0, _name, OBJPROP_TEXT, text);} // Method to set the text content
    
    string           GetText() {return ObjectGetString(0, _name, OBJPROP_TEXT);} // Method to retrieve the text content
    
    void             SetFontSize(int fontSize) {ObjectSetInteger(0, _name, OBJPROP_FONTSIZE, fontSize);} // Method to set the font size
    
    void             SetFont(string fontName) {ObjectSetString(0, _name, OBJPROP_FONT, fontName);} // Method to set the font name
   };

//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
Label::Label(void)
   {

   }

//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
Label::~Label(void)
   {

   }

//+------------------------------------------------------------------+
//| Method to create a label object                                  |
//+------------------------------------------------------------------+
void Label::Create(string name, int xDis, int yDis)
   {
    // Code to create label object, set its position, and assign its name
    ObjectCreate(0, name, OBJ_LABEL, 0, 0, 0);
    ObjectSetInteger(0, name, OBJPROP_XDISTANCE, xDis);
    ObjectSetInteger(0, name, OBJPROP_YDISTANCE, yDis);
    _name = name;
   }
//+------------------------------------------------------------------+