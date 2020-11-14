### venv
```
pip3 install virtualenv
 mkdir myproject && cd myproject

virtualenv venv

source venv/bin/activate

pip install numpy

python
>>> import numpy
>>> print(numpy)
<module 'numpy' from '/Users/james/Desktop/myproject/venv/lib/python3.7/site-packages/numpy/__init__.py'>
>>>

deactivate
```