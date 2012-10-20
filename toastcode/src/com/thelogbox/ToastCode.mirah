package com.thelogbox

import android.app.Activity
import android.os.Bundle
import android.widget.Toast
import android.content.Context
import android.view.View
import android.widget.LinearLayout
import android.widget.Button


class ToastView < LinearLayout
    
  def initialize(ctx:Context)
    super(ctx)
    
    @ctx = ctx
    @button = Button.new ctx 
    
    @button.setText "Toast me!"
    @button.setOnClickListener do |x|
      notification = Toast.makeText(ToastCode.ctx, "Yo", Toast.LENGTH_SHORT)
      notification.show()
    end
       
    setOrientation(LinearLayout.VERTICAL)
    addView(@button)
  end
    
end

class ToastCode < Activity

  def onCreate(state)
    super state    
    @view = ToastView.new self
    @@ctx = getApplicationContext()
    
    setContentView @view
  end
  
  def self.ctx
    @@ctx
  end
end
