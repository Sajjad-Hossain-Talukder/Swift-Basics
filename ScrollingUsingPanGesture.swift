 @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        let velocity = gestureRecognizer.velocity(in: allProjectView)
        

        
        if gestureRecognizer.state == .began {
            print(" Began ")
            preDis = 0.0
            mxHeight = projectItemCollection.contentSize.height
        }
        
        if gestureRecognizer.state == .changed {
            //print(" Changed ")

            let position = gestureRecognizer.translation(in: allProjectView)
            let crossedDistance = abs(position.y - preDis)
            
            
           // print(preDis , position.y )
            
            if preDis > position.y {
               //print(" Up ")
                upDirection = 1
                
                if collapsedHeight.constant-crossedDistance > 0 {
                    
                    //print(" Not Collapsed yet  " , crossedDistance)
                    collapsedHeight.constant -= crossedDistance
                    quickActionButton.alpha =  collapsedHeight.constant / collapsedMaxHeight
 
                    
                } else {
                    
                   // print(" Collapsed ALREADY  ")
                    
                    collapsedHeight.constant = 0.0
                    quickActionButton.alpha = 0.0
                    
                    //print(projectItemCollection.contentOffset.y)
                    projectItemCollection.contentOffset = CGPoint(x: 0, y: projectItemCollection.contentOffset.y + crossedDistance )
                    
                    let bottomEdge = projectItemCollection.contentOffset.y + projectItemCollection.frame.size.height
                    reachedBottom = ( bottomEdge >= projectItemCollection.contentSize.height) ?  true : false
                        
                    
                }
                
                
                
                
            } else {
                //print(" Down ")
                upDirection = 2
                
                reachedTop = projectItemCollection.contentOffset.y  > 0.0 ? false : true
                
            
                
               // print( projectItemCollection.contentOffset.y , crossedDistance )
                
                if  !reachedTop {
                   // print( " I am scrolling View ")
                    projectItemCollection.contentOffset = CGPoint(x: 0, y: projectItemCollection.contentOffset.y - crossedDistance )
                } else {
                   // print(" Already Top Visible ... Open Collapse " ,  projectItemCollection.contentOffset.y , collapsedHeight.constant , crossedDistance )
                    projectItemCollection.contentOffset = CGPoint(x: 0, y: projectItemCollection.contentOffset.y )
                    if collapsedHeight.constant+crossedDistance < collapsedMaxHeight {
                        collapsedHeight.constant+=crossedDistance
                        quickActionButton.alpha = collapsedHeight.constant/collapsedMaxHeight
                    } else {
                        collapsedHeight.constant = collapsedMaxHeight
                        quickActionButton.alpha = 1.0
                    }
                    
                }
                
               // print(projectItemCollection.contentOffset.y , " inside Down " )
                
                
            }

            preDis = position.y
        }
        
        
        if gestureRecognizer.state == .ended {
            print(" Ended ")
            
            let speed = sqrt(pow(velocity.x, 2) + pow(velocity.y, 2))
            print("Speed: \(speed) points per second")
            
//
//            if speed > 0 {
//                var distance = speed*0.3
//                if upDirection == 2 {
//                    distance *= (-1)
//                } else  if upDirection == 1 {
//                    
//                    
//    
//                projectItemCollection.setContentOffset(CGPoint(x: 0, y: projectItemCollection.contentOffset.x+distance), animated: true )
//                        
//                    
//                    
//                }
//                
//            }
            
            
            if reachedBottom {
                let bottomOffset = CGPoint(x: 0, y: max( projectItemCollection.contentSize.height - projectItemCollection.bounds.size.height, 0))
                projectItemCollection.setContentOffset(bottomOffset, animated: true )
                reachedBottom = false
            }
            
            if upDirection == 1 && collapsedHeight.constant > 0 {
                UIView.animate(withDuration: 0.3, animations: {
                    self.collapsedHeight.constant = 0.0
                    self.ProjectView.layoutIfNeeded()
                    self.quickActionButton.alpha = 0.0
                })
            }
            
            if reachedTop == false {
                projectItemCollection.reloadData()
            }
            
           // print( upDirection , collapsedHeight.constant , reachedTop , " Ended Detailes ")
            
            if upDirection == 2 && collapsedHeight.constant < collapsedMaxHeight && reachedTop {
                
                self.projectMenuCollection.reloadData()
                
                UIView.animate(withDuration: 0.3, animations: {
                    self.collapsedHeight.constant = self.collapsedMaxHeight
                    self.ProjectView.layoutIfNeeded()
                    self.quickActionButton.alpha = 1.0
                })
                
                reachedTop = false
                
            }
           
        }
        
    }
    
