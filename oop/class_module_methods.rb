module MyMod
  def meth3
    puts 'Meth3 - instance of module MyMod'
  end
end

class MyClass
  class << self     # self - MyClass
    include MyMod
  end
end

MyClass.meth3
