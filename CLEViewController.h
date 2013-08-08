//
//  CLEViewController.h
//  CatalogoListaEmpresas
//
//  Created by Pedro Farias Barbosa on 03/08/13.
//  Copyright (c) 2013 Pedro Farias Barbosa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLEViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *listaEmpresas;
}

@property (retain, nonatomic) IBOutlet UITableView *tabelaEmpresas;

@end
