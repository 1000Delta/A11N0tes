# encoding: utf-8

import numpy
import math

class Distance:

    def __init__(self, v1, v2):
        # 向量维度检查
        if a.shape != b.shape and len(x1.shape) != 1
        self.v1 = v1
        self.v2 = v2

    ''' eculidDistance
    欧式距离
    x1 ,x2 为同维度向量
    '''
    def eculidDistance(self):
        # 向量维数判断
        if len(self.v1.shape) != 1 and self.v1.shape != self.v2.shape:
            return (0, False)
        l = 0
        for i in range(self.v1.shape):
            l += (v1[i] - v2[i]) ** 2
        return math.sqrt(l)