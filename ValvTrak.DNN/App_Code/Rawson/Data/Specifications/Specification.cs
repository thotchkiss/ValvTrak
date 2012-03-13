using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace Rawson.Data
{
    public class Specification<T> : ISpecification<T>
    {
        private Expression<Func<T, bool>> _predicate;

        public Specification ( Expression<Func<T, bool>> predicate )
        {
            _predicate = predicate;
        }

        public Expression<Func<T, bool>> Predicate
        {
            get { return _predicate; }
        }

        public bool IsSatisfiedBy ( T entity )
        {
            return _predicate.Compile ().Invoke ( entity );
        }

        public static Specification<T> operator & ( Specification<T> leftSide, Specification<T> rightSide )
        {
            var rightInvoke = Expression.Invoke ( rightSide.Predicate, leftSide.Predicate.Parameters.Cast<Expression> () );
            var newExpression = Expression.MakeBinary ( ExpressionType.AndAlso, leftSide.Predicate.Body, rightInvoke );

            return new Specification<T> (
                                    Expression.Lambda<Func<T, bool>> ( newExpression, leftSide.Predicate.Parameters )
                                  );
        }

        public static Specification<T> operator | ( Specification<T> leftSide, Specification<T> rightSide )
        {
            var rightInvoke = Expression.Invoke ( rightSide.Predicate, leftSide.Predicate.Parameters.Cast<Expression> () );
            var newExpression = Expression.MakeBinary ( ExpressionType.OrElse, leftSide.Predicate.Body, rightInvoke );

            return new Specification<T> (
                                    Expression.Lambda<Func<T, bool>> ( newExpression, leftSide.Predicate.Parameters )
                                  );

        }


    }
}



