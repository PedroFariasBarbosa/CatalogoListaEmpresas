//
//  CLEEmpresa.h
//  CatalogoListaEmpresas
//
//  Created by Pedro Farias Barbosa on 03/08/13.
//  Copyright (c) 2013 Pedro Farias Barbosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLEEmpresa : NSObject
{
    NSString *nome;
    NSString *quantidadeFuncionarios;
}

-(id) initWithName: (NSString *) nomeInicial andQuantidade: (NSString *) quantidadeInicial;

@property (nonatomic,retain) NSString *nome;
@property (nonatomic,retain) NSString *quantidadeFuncionarios;
@end
