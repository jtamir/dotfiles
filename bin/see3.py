#!/usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt
from matplotlib import gridspec
import cfl
import sys

class Plotter:
    def __init__(self, data, line, ax1, ax2, ranges, color):
        self.data = data
        self.line = line
        self.ax1 = ax1
        self.ax2 = ax2
        self.ranges = ranges
        self.color = color
        self.x = 0
        self.y = 0
        self.first = True
        self.cid = line.figure.canvas.mpl_connect('button_press_event', self)

    def __call__(self, event):
        if event.inaxes!=self.line.axes:
            return

        self.x = int(event.xdata)
        self.y = int(event.ydata)

        d = self.data[self.y, self.x, :].squeeze()

        self.ax1.plot(self.x, self.y, 'o', markersize=5, color=self.color, markeredgecolor='black')
        self.ax2.plot(d, linewidth=3, color=self.color)
        self.ax2.set_title('({}, {})'.format(self.y, self.x))

        self.ax1.set_xlim(self.ranges[0][0], self.ranges[0][1])
        self.ax1.set_ylim(self.ranges[1][0], self.ranges[1][1])

        self.ax2.set_ylim(.9*np.min(d), 1.1*np.max(d))

        if self.first:
            self.first = False
        else:
            self.ax1.lines[0].remove()
            self.ax2.lines[0].remove()

        self.ax1.invert_yaxis()
        self.line.figure.canvas.draw()


def see3(data, title='||X||', cmap='viridis'):

    #fig = plt.figure(figsize=(16,6))
    fig = plt.figure()
    ax1 = fig.add_subplot(121)
    ax2 = fig.add_subplot(122)
    ax1.set_title(title)
    

    assert len(data.shape) == 3, 'must be 3-dimensional'

    while len(data.shape) > 3:
        data_norm = np.linalg.norm(data, axis=2).squeeze()

    line = ax1.imshow(np.linalg.norm(data, axis=2), cmap=cmap) 
    ranges = [(0, data[:,:,0].shape[1]), (0, data[:,:,0].shape[0])]

    plotter = Plotter(data, line, ax1, ax2, ranges, 'red')

    plt.show()


img = np.abs(cfl.readcfl(sys.argv[1]).squeeze())
see3(img, title=sys.argv[1], cmap='gray')

