package com.thelogbox

import android.app.Activity
import android.widget.LinearLayout
import android.widget.Button
import android.content.Context
import android.view.View
import android.view.View.OnClickListener
import android.widget.Toast

class ButtonsView < LinearLayout
  implements OnClickListener
  
  def initialize(ctx:Context)
    super ctx
    
    @one = Button.new ctx
    @two = Button.new ctx
    @three = Button.new ctx
    
    @one.setText "One"
    @two.setText "Two"
    @three.setText "Three"
    
    # need to set the Id  of each Button obj because this is
    # is what we will use to determine which of them was clicked
    
    @one.setId 1
    @two.setId 2
    @three.setId 3
    
    @one.setOnClickListener self
    @two.setOnClickListener self
    @three.setOnClickListener self

    addView(@one)
    addView(@two)
    addView(@three)
    
    setOrientation LinearLayout.VERTICAL

  end
  
  def onClick(v:View)
    
    # v.getId will return an integer. If you defined the view declarative, the AAPT
    # (android asset packaging tool) would have kicked in and generated an R.layout.xxx
    # java class, we could use that id to determine which button was clicked.
    # But since the view was done programmatically, the aapt did not kick in, hence
    # we need to define our own ids for each button
    
    toast = Toast.makeText(Buttons.getAppContext,"#{v.getId}", Toast.LENGTH_SHORT)
    toast.show
  end
  
end

class Buttons < Activity
  def onCreate(state)
    super state
    @@ctx = getApplicationContext
    setContentView ButtonsView.new(self)
  end
  
  def self.getAppContext
    @@ctx
  end
  
end
