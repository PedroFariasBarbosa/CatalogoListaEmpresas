//
//  CLEEmpresa.m
//  CatalogoListaEmpresas
//
//  Created by Pedro Farias Barbosa on 03/08/13.
//  Copyright (c) 2013 Pedro Farias Barbosa. All rights reserved.
//

#import "CLEEmpresa.h"

@implementation CLEEmpresa

@synthesize nome,quantidadeFuncionarios;

-(id) initWithName:(NSString *)nomeInicial andQuantidade:(NSString *)quantidadeInicial{
    if(self = [super init]){
        self.nome = nomeInicial;
        self.quantidadeFuncionarios = quantidadeInicial;
    }
    return self;
}

-(void) dealloc{
    [nome release];
    [quantidadeFuncionarios release];
    [super dealloc];
}

@end
