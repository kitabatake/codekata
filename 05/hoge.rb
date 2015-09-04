require 'objspace'


p ObjectSpace.memsize_of ({ab: "hoge", ho: "hfeaw"})

p ObjectSpace.memsize_of ([1,2,3,4,5,6,3,2,323,32324,4343])