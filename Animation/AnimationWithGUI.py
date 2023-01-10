from tkinter import *
from turtle import *
from MCdrawingfunction import MonteCarloVis

#makes a widget for entry and a window to draw the rectangular grid and node
window=Tk()
window2=Tk()
window.title("Input")
window2.title("Monte Carlo Simulation Example")
window2.geometry("1200x1200")
window.geometry("200x100")
lable=Label(window,text="Grid Size")
lable.pack(pady=15)
canvas=Canvas(window2)
tsc=TurtleScreen(canvas)
marker=RawTurtle(tsc)
node=RawTurtle(tsc)
node.hideturtle()
marker.hideturtle()
#node.hideturtle()
marker.penup()
marker.goto(-140,105)
node.penup()
node.goto(-140,105)
marker.pendown()
canvas.pack(side=LEFT, expand=True, fill=BOTH)
data1=Entry()
data1.pack()
data1.config(font=('Aeial',18))




#this makes it so we can keep track of the data entered in the window
def submit():
    grid=int(data1.get())
    width=750
    length=1100
    #makes a rectangle to use as a grid
    MonteCarloVis(grid,marker,node,length,width)

confirm=Button(window,text="confirm",command=submit)
confirm.pack()



window.mainloop()
window2.mainloop()