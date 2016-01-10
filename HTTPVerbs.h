/*
 
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
SOFTWARE.
 
 */

/*
 
 RELEASE NOTES
 
 Version 1.0 (Current Version)
 
 - Methods for HTTP verbs (GEt, POST, PUT, DELETE)
 - Method to execute any HTTP operation
 
 */

#import <Foundation/Foundation.h>

@interface HTTPVerbs : NSObject

/* HTTP verbs */

/*
 
 Name: getOperation:Success:Failure
 Description: It allows to retrieve a resource or list of resources.
 Arguments:
    - url
 Returns: an asynchronous response.
    - success (result, error, response, statusCode)
    - error (result, error, response, statusCode)
 
 */

+ (void)getOperation:(NSURL *)url
             Success:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))success
             Failure:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))failure;

/* 
 
 Name: postOperation:Data:Success:Failure
 Description: It allows to create new resources.
 Arguments:
    - url
    - data (json format)
 Returns: an asynchronous response.
    - success (result, error, response, statusCode)
    - error (result, error, response, statusCode)
 
 */

+ (void)postOperation:(NSURL *)url
                 Data:(NSDictionary *)data
              Success:(void(^)(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode))success
              Failure:(void(^)(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode))failure;

/*
 
 Name: putOperation:Data:Success:Failure
 Description: It allows to update a resource with an specific ID.
 Arguments:
    - url
    - data
 Returns: an asynchronous response.
    - success (result, error, response, statusCode)
    - error (result, error, response, statusCode)
 
 */

+ (void)putOperation:(NSURL *)url
                Data:(NSDictionary *)data
             Success:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))success
             Failure:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))failure;

/*
 
 Name: deleteOperation:Success:Failure
 Description: It allows to delete a resource with an specific ID.
 Arguments:
    - url
 Returns: an asynchronous response.
    - success (result, error, response, statusCode)
    - error (result, error, response, statusCode)
 
 */

+ (void)deleteOperation:(NSURL *)url
                Success:(void(^)(NSData *result,
                                 NSError *error,
                                 NSURLResponse *response,
                                 NSInteger statusCode))success
                Failure:(void(^)(NSData *result,
                                 NSError *error,
                                 NSURLResponse *response,
                                 NSInteger statusCode))failure;

@end
