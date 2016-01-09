# HTTPVerbs
A set of functions for using HTTP methods in RESTful services.

## Version 1.0 (Current version)
- Methods for HTTP verbs (GEt, POST, PUT, DELETE)
- Method to execute any HTTP operation

## Usage
Download both the .h and .m files and add them to your project.
 ```
 [HTTPVerbs GetOperation:url 
            Success:^(NSData *result, NSError *error, NSURLResponse *response, NSINteger statusCode) 
  {
      // Success code goes here
  }
            Failure:^(NSData *result, NSError *error, NSURLResponse *response, NSINteger statusCode) 
  {
      // Error code goes here
  }];
  ```

## Licence
The MIT License (MIT)

Copyright (c) 2016 José Antonio González Rodríguez <jagonzalr@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE

