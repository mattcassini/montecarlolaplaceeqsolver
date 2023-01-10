import turtle
import random
import tkinter
import numpy as ny


def MonteCarloVis(size,marker,node,length,width):
    delta1=length/(size-1)
    delta2=width/(size-1)
    #position matrix set up
    positions_matrix=ny.zeros([size,size])
    marker.speed(speed=0)
    for i in range(1,size-1):
        for j in range(1,size-1):
            positions_matrix[i][j]=1
    row=random.randint(2,size-2)
    col=random.randint(2,size-2)
    #node we will watch
    #node.hideturtle()
    node.penup()
    node.pencolor("blue")
    node.shape("circle")
    node.speed(4)
    node.turtlesize(0.85)
    node.width(6)
    node.hideturtle()
    # makes a square
    marker.hideturtle()
    marker.forward(length)
    marker.right(90)
    marker.forward(width)
    marker.right(90)
    marker.forward(length)
    marker.right(90)
    marker.forward(width)
    marker.right(90)
    marker.speed(0)
    
    # makes the gridlines
    
    if size%2==0:
        for i in range(int(size/2)-1):
            marker.forward(delta1)
            marker.setheading(270)
            marker.forward(width)
            marker.setheading(0)
            marker.forward(delta1)
            marker.setheading(90)
            marker.forward(width)
            marker.setheading(0)
        marker.forward(delta1)
        marker.setheading(270)
        
        for j in range(int(size/2)-1):
            marker.forward(delta2)
            marker.setheading(180)
            marker.forward(length)
            marker.setheading(270)
            marker.forward(delta2)
            marker.setheading(0)
            marker.forward(length)
            marker.setheading(270)
        
        
        
    else:
        for m in range(int(size/2)):
            marker.forward(delta1)
            marker.setheading(270)
            marker.forward(width)
            marker.setheading(0)
            marker.forward(delta1)
            marker.setheading(90)
            marker.forward(width)
            marker.setheading(0)
        marker.setheading(270)
        
        for k in range(int(size/2)):
            marker.forward(delta2)
            marker.setheading(180)
            marker.forward(length)
            marker.setheading(270)
            marker.forward(delta2)
            marker.setheading(0)
            marker.forward(length)
            marker.setheading(270)
    
    #picks a random node to run a montecarlo simulation on
    row=random.randint(1,size-2)
    col=random.randint(1,size-2)
    node.speed(speed=0)
    node.setheading(270)
    node.forward(delta2*row)
    node.setheading(0)
    node.forward(delta1*col)
    node.showturtle()
    node.speed(speed=0.9)
    node.pendown()
    run=True
    while run==True:
        r=random.random()
        if positions_matrix[row][col]==0:
            break
        if r<=0.25:
            row-=1
            node.setheading(90)
            node.forward(delta2)
        elif r>0.25 and r<=0.5:
            row+=1
            node.setheading(270)
            node.forward(delta2)
        elif r>0.5 and r<=0.75:
            col-=1
            node.setheading(180)
            node.forward(delta1)
        else:
            col+=1
            node.setheading(0)
            node.forward(delta1)
        



        
            
    
    
            
    
   
