package com.pubsub.publisher.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
class PublisherController{
   @GetMapping("/publish")
   public String  publishMessage(@RequestParam("message") String message){
          return message;
   }
   @GetMapping("/info")
   public String  publisherInfo(){
          return "Hello";
   }
}