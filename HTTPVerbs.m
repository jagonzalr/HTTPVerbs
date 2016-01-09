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

#import "HTTPVerbs.h"

@interface HTTPVerbs ()

+ (void)FetchOperation:(NSMutableURLRequest *)urlRequest
               Success:(void(^)(NSData *result,
                                NSError *error,
                                NSURLResponse *response,
                                NSInteger statusCode))success
               Failure:(void(^)(NSData *result,
                                NSError *error,
                                NSURLResponse *response,
                                NSInteger statusCode))failure;

@end

@implementation HTTPVerbs

+ (void)GetOperation:(NSURL *)url
             Success:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))success
             Failure:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))failure
{
    // Configure the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
                                       initWithURL:url];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest setValue:@"application/json"
      forHTTPHeaderField:@"Content-Type"];
    
    // Fetch the request
    [HTTPVerbs FetchOperation:urlRequest
                 Success:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         success(result, error, response, statusCode);
     }
                 Failure:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         failure(result, error, response, statusCode);
     }];
}

+ (void)PostOperation:(NSURL *)url
                 Data:(NSDictionary *)data
              Success:(void(^)(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode))success
              Failure:(void(^)(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode))failure
{
    // Configure the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
                                       initWithURL:url];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:data
                                                       options:0
                                                         error:&error];
    
    NSString *postLength =
    [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    
    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json"
      forHTTPHeaderField:@"Content-Type"];
    
    [urlRequest setValue:postLength
      forHTTPHeaderField:@"Content-Length"];
    
    [urlRequest setHTTPBody:postData];
    
    // Call the request
    [self FetchOperation:urlRequest
                 Success:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         success(result, error, response, statusCode);
     }
                 Failure:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         failure(result, error, response, statusCode);
     }];
}

+ (void)PutOperation:(NSURL *)url
                Data:(NSDictionary *)data
             Success:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))success
             Failure:(void(^)(NSData *result,
                              NSError *error,
                              NSURLResponse *response,
                              NSInteger statusCode))failure
{
    // Configure the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
                                       initWithURL:url];
    NSError *error;
    NSData *putData = [NSJSONSerialization dataWithJSONObject:data
                                                      options:0
                                                        error:&error];
    
    NSString *putLength =
    [NSString stringWithFormat:@"%lu", (unsigned long)[putData length]];
    
    [urlRequest setHTTPMethod:@"PUT"];
    [urlRequest setValue:@"application/json"
      forHTTPHeaderField:@"Content-Type"];
    
    [urlRequest setValue:putLength
      forHTTPHeaderField:@"Content-Length"];
    
    [urlRequest setHTTPBody:putData];
    
    // Call the request
    [self FetchOperation:urlRequest
                 Success:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         success(result, error, response, statusCode);
     }
                 Failure:^(NSData *result,
                           NSError *error,
                           NSURLResponse *response,
                           NSInteger statusCode)
     {
         failure(result, error, response, statusCode);
     }];
}

+ (void)DeleteOperation:(NSURL *)url
                Success:(void(^)(NSData *result,
                                 NSError *error,
                                 NSURLResponse *response,
                                 NSInteger statusCode))success
                Failure:(void(^)(NSData *result,
                                 NSError *error,
                                 NSURLResponse *response,
                                 NSInteger statusCode))failure
{
    // Configure the request
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc]
                                       initWithURL:url];
    
    [urlRequest setHTTPMethod:@"DELETE"];
    [urlRequest setValue:@"application/json"
      forHTTPHeaderField:@"Content-Type"];
    
    // Call the request
    [self FetchOperation:urlRequest
                     Success:^(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode)
     {
        success(result, error, response, statusCode);
     }
                     Failure:^(NSData *result,
                               NSError *error,
                               NSURLResponse *response,
                               NSInteger statusCode)
     {
         failure(result, error, response, statusCode);
     }];
}

+ (void)FetchOperation:(NSMutableURLRequest *)urlRequest
               Success:(void(^)(NSData *result,
                                NSError *error,
                                NSURLResponse *response,
                                NSInteger statusCode))success
               Failure:(void(^)(NSData *result,
                                NSError *error,
                                NSURLResponse *response,
                                NSInteger statusCode))failure
{
    // Configure the session
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration
                                                defaultSessionConfiguration];
    
    [configuration setAllowsCellularAccess:YES];
    
    // Configure the task
    NSURLSessionTask *task = [[NSURLSession
                               sessionWithConfiguration:configuration]
                              dataTaskWithRequest:urlRequest
                              completionHandler:^(NSData * _Nullable data,
                                                  NSURLResponse * _Nullable res,
                                                  NSError * _Nullable error)
                              {
                                  // Get the status code
                                  NSHTTPURLResponse *httpResponse =
                                  (NSHTTPURLResponse *)res;
                                  
                                  NSInteger statusCode =
                                  [httpResponse statusCode];
                                  
                                  // call the completion handler
                                  if (error) {
                                      failure(data,
                                              error,
                                              res,
                                              statusCode);
                                  } else {
                                      success(data,
                                              error,
                                              res,
                                              statusCode);
                                  }
                              }];
    
    // Call the task
    [task resume];
}

@end
