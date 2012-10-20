package com.thelogbox

import android.app.Activity
import android.view.View
import android.widget.TextView
import android.content.Context
import android.widget.LinearLayout
import android.widget.EditText
import android.widget.ScrollView
import android.widget.Button
import android.view.ViewGroup
import android.view.View.OnClickListener
import android.widget.LinearLayout.LayoutParams

class DBView < LinearLayout
  implements OnClickListener
  
  def initialize(ctx:Context)
    super ctx
    
    @txtinput = EditText.new ctx
    @txtoutput = TextView.new ctx
    @viewport = ScrollView.new ctx
    @btnsave = Button.new ctx
        
    @txtinput.setLayoutParams getLayoutParams
    @btnsave.setLayoutParams getLayoutParams
    @viewport.setLayoutParams getLayoutParams
    
    @btnsave.setText "Save"
    @txtoutput.setText "Yo yo yo"
    @txtinput.setText "Ready"
  
    @viewport.addView @txtoutput
    
    @btnsave.setOnClickListener(self)
    
    # ADD the widgets to the MainView
    
    addView @txtinput
    addView @btnsave
    addView @viewport

    setOrientation LinearLayout.VERTICAL    
  end
  
  def getLayoutParams:LayoutParams
    width = ViewGroup.LayoutParams.FILL_PARENT
    height = ViewGroup.LayoutParams.WRAP_CONTENT    
    LayoutParams.new width, height
  end
  
  def onClick(view:View)
    temp = StringBuffer.new
    temp.append @txtoutput.getText.toString
    temp.append "\n".toString
    temp.append @txtinput.getText.toString
    @txtoutput.setText temp.toString
    @viewport.awakenScrollBars
  end
    
end

# ----------------------------------------




# ----------------------------------------

class DBSample < Activity
  def onCreate(state)
    super state
    @view = DBView.new(self)
    setContentView @view
  end
end


