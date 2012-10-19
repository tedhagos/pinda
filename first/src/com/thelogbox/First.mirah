package com.thelogbox

import android.app.Activity
import android.view.View
import android.widget.TextView
import android.content.Context
import android.widget.LinearLayout


class FirstView < LinearLayout 
    
    def initialize(ctx:Context)
       super(ctx) 
       
       @mtext = TextView.new ctx
       @mtext.setText "Ready"
       setOrientation(LinearLayout.VERTICAL)
       addView(@mtext)
       
    end
end


class First < Activity
    
  def onCreate(state)
    super state
    
    @view = FirstView.new(self)
    
    setContentView @view
  end
end
