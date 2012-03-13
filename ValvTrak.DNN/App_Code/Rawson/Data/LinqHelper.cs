using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Rawson.Data.Utilties
{
    public static class LinqHelper
    {
        /***********************************************************************************************************
         *
         *      var query1 = from e in context.Entities
         *                   where ids.Contains ( e.ID )
         *                   select e;
         *
         *      var query2 = context.Entities.Where ( BuildContainsExpression<Entity, int> ( e => e.ID, ids ) );
         *
         *************************************************************************************************************/
        public static Expression<Func<TElement, bool>> BuildContainsExpression<TElement, TValue> (
            Expression<Func<TElement, TValue>> valueSelector, IEnumerable<TValue> values )  
        {

            if ( null == valueSelector ) { throw new ArgumentNullException ( "valueSelector" ); }

            if ( null == values ) { throw new ArgumentNullException ( "values" ); }

            ParameterExpression p = valueSelector.Parameters.Single ();

            // p => valueSelector(p) == values[0] || valueSelector(p) == ...

            if ( !values.Any () )
            {

                return e => false;

            }

            var equals = values.Select ( value => ( Expression )Expression.Equal ( valueSelector.Body, Expression.Constant ( value, typeof ( TValue ) ) ) );
            var body = equals.Aggregate<Expression> ( ( accumulate, equal ) => Expression.Or ( accumulate, equal ) );

            return Expression.Lambda<Func<TElement, bool>> ( body, p );

        }

        public static Expression<Func<T,bool>> Join<T>( Expression<Func<T,bool>> leftSide, Expression<Func<T,bool>> rightSide )
        {
            var rightInvoke = Expression.Invoke ( rightSide, leftSide.Parameters.Cast<Expression> () );
            var newExpression = Expression.MakeBinary ( ExpressionType.AndAlso, leftSide.Body, rightInvoke );

            return Expression.Lambda<Func<T, bool>> ( newExpression, leftSide.Parameters );
        }


    }
}
